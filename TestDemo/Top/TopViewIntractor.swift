import Foundation
import SwiftHTTP
enum TopType:String {
    case TopList = "TopList"
}
protocol FriendsIntractorDelegate {
    func topResponse(errorWhileFetchingData:Bool, requesType:TopType,_ topList:[TopModel],_ popularList:[PopularModel])
}
class TopViewIntractor:RequestHandlerDelegate {
    var requestHandler:RequestHandler!
    open var delegate:FriendsIntractorDelegate!
    
    init(param:inout HTTPParameterProtocol?,requestName:TopType) {
        if self.requestHandler != nil {
            self.requestHandler.cancelAllRequest()
        }
        self.requestHandler = RequestHandler()
        self.requestHandler.delegateCustom = self
        
        let url:String
        
        switch requestName {
        case .TopList:
            url = "https://www.desidime.com/api/v1/premium_deals/list/"
            break
        }
        requestHandler.executePost(requestUrl: url, isToken: true, params: &param, requestName: requestName)
    }
    func serverResponse(responseResult: Any, responseName: Any, errorWhileDataFetching : Bool) {
        
        print(responseResult)
        var topList:[TopModel]  = []
        var popularList:[PopularModel]  = []
      
        if errorWhileDataFetching
        {
            self.delegate?.topResponse(errorWhileFetchingData: true, requesType: responseName as! TopType,topList,popularList)
        }
        else {
            DispatchQueue.main.async {
                let responseResultDict = ValidDataFormatter.getValidNSDictionary(responseResult as AnyObject)
                let responseAllKeys:NSArray = responseResultDict.allKeys as NSArray
                
                
                if responseAllKeys.contains("result") {
                    switch (responseName as! TopType) {
                    case .TopList:
                        
                        let dataDict = ValidDataFormatter.getValidNSDictionary((responseResultDict as! [String:Any])["result"] as AnyObject)
                        
                        let topArray = ValidDataFormatter.getValidNSArray((dataDict as! [String:Any])["top"] as AnyObject)
                        
                        let popularArray = ValidDataFormatter.getValidNSArray((dataDict as! [String:Any])["popular"] as AnyObject)
                        
                        if topArray.count > 0 || popularArray.count > 0{
                            
                            let topListArray = topArray
                            topList = TopModel.fromDictionary(topListArray)
                            
                            let popularListArray = popularArray
                            popularList = PopularModel.fromDictionary(popularListArray)
                            
                            
                            MessageConstant.popularListItems = popularList
                            
                            self.delegate?.topResponse(errorWhileFetchingData: errorWhileDataFetching, requesType:responseName as! TopType ,  topList,popularList)
                            
                        }
                        else{
                            self.delegate?.topResponse(errorWhileFetchingData: true, requesType: responseName as! TopType,topList,popularList)
                            
                        }
                        break
                    
                    }
                    
                }
                
            }
        }
    }
}
