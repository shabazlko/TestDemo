
import Foundation
import UIKit
import SwiftHTTP

protocol RequestHandlerDelegate
{
    func serverResponse(responseResult: Any, responseName: Any, errorWhileDataFetching:Bool)
}
class RequestHandler
{
    open var delegateCustom:RequestHandlerDelegate?
    var opt:HTTP! = nil
    
    func cancelAllRequest()
    {
        if (opt != nil) {
            opt.cancel()
        }
    }
    func executePost(requestUrl:String, isToken:Bool,params:inout HTTPParameterProtocol?,requestName:Any)
    {
        if requestUrl == ""
        {
            return
        }
        print(requestUrl)
        
        if (opt != nil) {
            opt.cancel()
        }
        
        if InternetNetworkCheck.isInternetAvailable() {
            
            if isToken
            {
                do {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = true
                    AlertView.show(message: "Loading data...")
                    
                    let headerParams:NSDictionary = ["Accept":"application/json","timezone":TimeZone.current.identifier]
                    
                    var lparams:HTTPParameterProtocol = ["device_type":"iOS"]
                    lparams = [lparams,params]
                    
                    opt = HTTP.POST(requestUrl, parameters:params,headers: headerParams as? [String : String])
                    
                    opt.run { response in
                        print(response.description)
                        
                        
                        DispatchQueue.main.sync {
                            UIApplication.shared.isNetworkActivityIndicatorVisible = false
                        }
                        if  (requestName is String) &&  (requestName as! String) != "getItemsEdit"
                        {
                            AlertView.Hide()
                        }
                        
                        AlertView.Hide()
                        
                        
                        switch(response.statusCode)
                        {
                        case 200?:
                            do
                            {
                                let parsedData = try JSONSerialization.jsonObject(with: response.data, options: .allowFragments) as! [String:Any]
                                let responseResult = parsedData as NSDictionary
                                
                                
                                
                                if responseResult["result"] != nil || responseResult["result"] != nil{
                                    self.delegateCustom?.serverResponse(responseResult: responseResult, responseName: requestName,errorWhileDataFetching: false)
                                }
                                else
                                {
                                    if responseResult.object(forKey: "app_unautorised_access") != nil{
                                        DispatchQueue.main.async {
                                            self.delegateCustom?.serverResponse(responseResult: "", responseName: requestName ,errorWhileDataFetching: true)
                                            AlertView.show(responseResult.object(forKey: "message") as! String)
                                       
                                            
                                        }
                                    }
                                    else{
                                        if responseResult.object(forKey: "errors") != nil{
                                            
                                            DispatchQueue.main.async {
                                                self.delegateCustom?.serverResponse(responseResult: responseResult, responseName: requestName,errorWhileDataFetching: true)
                                                
                                                let dict = ValidDataFormatter.getValidNSDictionary(responseResult.object(forKey: "errors") as AnyObject)
                                                
                                                AlertView.showMBMessageWith(message: dict.object(forKey: "message") as! String)
                                            }
                                        }
                                        else{
                                            DispatchQueue.main.async {
                                                self.delegateCustom?.serverResponse(responseResult: responseResult, responseName: requestName,errorWhileDataFetching: true)
                                                AlertView.show(responseResult.object(forKey: "error") as! String)
                                            }
                                        }
                                    }
                                    
                                    
                                    
                                }
                            }
                            catch let error as NSError {
                                if error.code == 3840  {
                                    DispatchQueue.main.async {
                                        AlertView.show(MessageConstant.APICALLAMANAGER_PROBLEM_DATA_FETCH)
                                    }
                                }
                                
                                self.delegateCustom?.serverResponse(responseResult: "", responseName: requestName,errorWhileDataFetching: true)
                                //self.Hide(delegate: senderViewController!)
                            }
                            break
                            
                        default:
                            do {
                                
                                let parsedData = try JSONSerialization.jsonObject(with: response.data, options: .allowFragments) as! [String:Any]
                                let responseResult = parsedData as NSDictionary
                                
                                if responseResult["success"] != nil || responseResult["Success"] != nil{
                                    self.delegateCustom?.serverResponse(responseResult: responseResult, responseName: requestName,errorWhileDataFetching: false)
                                }
                                else
                                {
                                    if responseResult.object(forKey: "app_unautorised_access") != nil{
                                        DispatchQueue.main.async {
                                            self.delegateCustom?.serverResponse(responseResult: "", responseName: requestName ,errorWhileDataFetching: true)
                                            AlertView.show(responseResult.object(forKey: "message") as! String)
                                            
                                           
                                            
                                        }
                                    }
                                    else{
                                      
                                        let parsedData = try JSONSerialization.jsonObject(with: response.data, options: .allowFragments) as! [String:Any]
                                        
                                        
                                        let dict = parsedData as NSDictionary
                                        
                                            if dict["error"] != nil {
                                                let responseResult = ValidDataFormatter.getValidNSDictionary(dict.object(forKey: "error") as AnyObject?)
                                                let allKey:NSArray = responseResult.allKeys as NSArray
                                                var key = ""
                                                if allKey.count > 0
                                                {
                                                    key =  ValidDataFormatter.getValidStringFromObject( allKey[0] as AnyObject)
                                                }
                                                if key != ""
                                                {
                                                    DispatchQueue.main.async {
                                                        self.delegateCustom?.serverResponse(responseResult: "", responseName: requestName ,errorWhileDataFetching: true)
                                                    }
                                                    let arr =  ValidDataFormatter.getValidNSArray(responseResult.object(forKey: key) as AnyObject)
                                                    if arr.count > 0
                                                    {
                                                        let str  = ValidDataFormatter.getValidStringFromObject(arr[0] as AnyObject)
                                                        AlertView.showMBMessageWith(message: str)
                                                    }
                                                }
                                            }
                                        
                                    }
                                    
                                    
                                    
                                }
                            }
                            catch let error as NSError {
                                if error.code == 3840  {
                                    DispatchQueue.main.async {
                                        AlertView.show(MessageConstant.APICALLAMANAGER_PROBLEM_DATA_FETCH)
                                    }
                                }
                                
                                self.delegateCustom?.serverResponse(responseResult: "", responseName: requestName,errorWhileDataFetching: true)
                                //self.Hide(delegate: senderViewController!)
                            }
                            break
                        }
                    }
                }
            }
          
            
        }
        else
        {
            self.delegateCustom?.serverResponse(responseResult: "", responseName: requestName,errorWhileDataFetching: true)
            //AlertView.show(MessageConstant.INTERNET_ERROR)
            AlertView.showMBMessageWith(message: MessageConstant.INTERNET_ERROR)
        }
    }
}
