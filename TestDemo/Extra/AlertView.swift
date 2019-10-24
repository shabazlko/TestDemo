
import Foundation
import SCLAlertView
import MBProgressHUD


class AlertView {
    
    class func show(_ message: String)
    {
        let alert = UIAlertController(title: AlertViewConstant.ALERT_TITLE, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: AlertViewConstant.ALERT_OK_BUTTON, style: .cancel) { action -> Void in
            alert.removeFromParent()
        }
        alert.addAction(okAction)
        DispatchQueue.main.async(execute: {
            //Utils.getController().present(alert, animated: true, completion: nil)
        })
    }
    class func showMBMessageWith(message:String)
    {
        DispatchQueue.main.async {
        var showMessageHud:MBProgressHUD = MBProgressHUD()
            let window:UIWindow?? = UIApplication.shared.delegate?.window
        showMessageHud = MBProgressHUD.showAdded(to: window!, animated: true);
        showMessageHud.mode = MBProgressHUDMode.customView
        showMessageHud.detailsLabelText = message;
        showMessageHud.detailsLabelFont = UIFont(name: "HelveticaNeue-Medium", size: 15.0)
        showMessageHud.isUserInteractionEnabled = false;
        showMessageHud.hide(true, afterDelay: TimeInterval(AlertViewConstant.POP_UP_DISPLAY_TIME_ONE_AND_HALF_SEC));
        }
    }
    
    class func show(message:String = "Processing...")
    {
        var load : MBProgressHUD = MBProgressHUD()
        let window:UIWindow?? = UIApplication.shared.delegate?.window
        load = MBProgressHUD.showAdded(to: window!, animated: true)
        load.mode = MBProgressHUDMode.indeterminate
        //load.layer.zPosition=100
        
        if(message.count > 0) {
           // load.labelText = message;
        }
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    class public func Hide()
    {
        DispatchQueue.main.async {
            
            let window:UIWindow?? = UIApplication.shared.delegate?.window
            MBProgressHUD.hideAllHUDs(for: window!, animated: true)
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
    
}
