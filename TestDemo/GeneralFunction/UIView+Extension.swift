import Foundation
import UIKit

extension UIView {
    func rightBarButtonTwoImages()  -> UIView {
        let rightView = UIView(frame: CGRect(x: 0, y: 0, width : 30 , height: 30))
        rightView.isUserInteractionEnabled = false
        
        let imageName = "statusFilter"
        let image = UIImage(named: imageName)
        let filter = UIImageView(image: image!)
        filter.frame =  CGRect(x:7,y: 0,width: 23,height: 23)
        rightView.addSubview(filter)
        filter.isUserInteractionEnabled = false
        
        let image1 = UIImage(named: "esclamationSign")
        let exclamation = UIImageView(image:image1)
        exclamation.frame =  CGRect(x:1,y: 5,width: 6,height: 12)
        rightView.addSubview(exclamation)
        exclamation.isUserInteractionEnabled = false
        exclamation.isHidden = true
        return rightView
    }
    
    func roundCornersWithLayerMask(cornerRadii: CGFloat, corners: UIRectCorner) {
        let path = UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: cornerRadii, height: cornerRadii))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        layer.mask = maskLayer
    }
    
    func layerGradient() {
        let layer : CAGradientLayer = CAGradientLayer()
        layer.frame.size = self.frame.size
        layer.frame.origin = CGPoint(x: 0.0, y: 0.0)//CGPointMake(0.0,0.0)
        
        
        let color0 =  UIColor(red:74.0/255, green:107.0/255, blue:158.0/255, alpha:1).cgColor
        let color1 =  UIColor(red:21.0/255, green:22.0/255, blue: 54.0/255, alpha:1).cgColor
    
        
        layer.colors = [color0,color1]
        self.layer.insertSublayer(layer, at: 0)
    }
    
}

