import UIKit
import SwiftHTTP
class UtilityClasses: NSObject {
    
    class func setFontSize() -> UIFont
    {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return MessageConstant.FONT_17
        }
        if MessageConstant.SCREEN_HEIGHT
        {
            return MessageConstant.FONT_10
        }
        return MessageConstant.FONT_12
    }
    class func setFontSizeLabelTitle() -> UIFont
    {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return MessageConstant.FONT_22
        }
        if MessageConstant.SCREEN_HEIGHT
        {
            return MessageConstant.FONT_13
        }
        return MessageConstant.FONT_15
    }
    class func setFontSizeLabelSubTitle() -> UIFont
    {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return MessageConstant.FONT_16
        }
        if MessageConstant.SCREEN_HEIGHT
        {
            return MessageConstant.FONT_09
        }
        return MessageConstant.FONT_11
    }
    class func setFontSizeForButton() -> UIFont
    {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return MessageConstant.FONT_19_Button_Bold
        }
        if MessageConstant.SCREEN_HEIGHT
        {
            return MessageConstant.FONT_12_Button_Bold
        }
        return MessageConstant.FONT_15_Button_Bold
    }
    class func setFontSizeForSmallButton() -> UIFont
    {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return MessageConstant.FONT_15_Button_Bold
        }
        if MessageConstant.SCREEN_HEIGHT
        {
            return MessageConstant.FONT_09_Button_Bold
        }
        return MessageConstant.FONT_11_Button_Bold
    }
    class func setFontSizeNavigationTitle() -> UIFont
    {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return MessageConstant.FONT_17
        }
        if MessageConstant.SCREEN_HEIGHT
        {
            return MessageConstant.FONT_08
        }
        return MessageConstant.FONT_08
    }
   
    
}
