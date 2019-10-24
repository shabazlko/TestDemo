
import UIKit

@IBDesignable class CustomUILabel: UILabel {

    @IBInspectable var applyFont: Bool = false {
        
        didSet {
            if MessageConstant.SCREEN_HEIGHT || UIDevice.current.userInterfaceIdiom == .pad
            {
                self.font = UtilityClasses.setFontSize()
            }
            else{
                self.font = MessageConstant.FONT_13
            }
        }
    }

    
    @IBInspectable var applyFontTitle: Bool = false {
        
        didSet {
            if MessageConstant.SCREEN_HEIGHT || UIDevice.current.userInterfaceIdiom == .pad
            {
                self.font = UtilityClasses.setFontSizeLabelTitle()
            }
            else{
                self.font = MessageConstant.FONT_17
            }
        }
    }
    @IBInspectable var applyFontSubTitle: Bool = false {
        
        didSet {
            if MessageConstant.SCREEN_HEIGHT || UIDevice.current.userInterfaceIdiom == .pad
            {
                self.font = UtilityClasses.setFontSizeLabelSubTitle()
            }
            else{
                self.font = MessageConstant.FONT_11
            }
        }
    }
    
    
    @IBInspectable var txtColor: UIColor = UIColor.gray {
        didSet {
            self.textColor = txtColor
        }
    }
    
    
}
