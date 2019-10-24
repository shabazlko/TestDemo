
import Foundation

class ValidDataFormatter {
    
    class func isNull(_ selected: AnyObject?) -> Bool {
        guard let someObject = selected else {
            return true
        }
        return (someObject is NSNull)
    }
    
    class func getValidNSDictionary(_ object:AnyObject?) -> NSDictionary
    {
        var localDictionary = NSDictionary()
        
        if self.isNull(object){
            return localDictionary
        }
        if object is NSDictionary {
            localDictionary = object as! NSDictionary
            return localDictionary
        }
        if  object is NSArray
        {
            if (object?.count)! > 0
            {
                if (object as! NSArray).object(at: 0) is NSDictionary {
                    return (object as! NSArray).object(at: 0) as! NSDictionary
                }
                else {
                    return localDictionary
                }
            }
            else
            {
                return localDictionary
            }
        }
        if object is String {
            localDictionary = [(object as! String):(object as! String)]
            return localDictionary
        }
        return localDictionary
    }
    
    class func getValidNSArray(_ object:AnyObject?) -> NSArray {
        
        var localArray:NSArray = NSArray()
        
        if self.isNull(object) {
            return localArray
        }
        if  object is NSArray {
            return object as! NSArray
        }
        if object is NSDictionary {
            localArray = NSArray(object: (object as? NSDictionary) ?? [])
            return localArray
        }
        if object is String {
            localArray = NSArray(object: (object as? String) ?? [])
            return localArray
        }
        return localArray
    }
    
    
    class func getValidStringFromObject(_ object:AnyObject?) -> String {
        
        if self.isNull(object) {
            return ""
        }
        if object is String {
            if (object as! String).isEmpty ||  (object as! String) == "" {
                return ""
            }
            return object as! String
        }
        if object is Int {
            if String(describing: (object as! Int)).isEmpty {
                return "0"
            }
            return String(describing: (object as! Int))
        }
        if object is Float {
            if String(describing: (object as! Float)).isEmpty {
                return "0.00"
            }
            return String(describing: (object as! Float))
        }
        if object is Double {
            if String(describing: (object as! Double)).isEmpty {
                return "0.00"
            }
            return String(describing: (object as! Double))
        }
        if object is Bool {
            if String(describing: (object as! Bool)).isEmpty {
                return "0"
            }
            return String(describing: (object as! Bool))
        }
        else {
            return ""
        }
    }
    
    
    class func getValidBoolValueForKey(_ object:AnyObject?) -> Bool {
        if self.isNull(object) {
            return false
        }
        if object is Bool {
            return object as! Bool
        }
        if object is Int {
            if (object as! Int)>0 {
                return true
            }
            else {
                return Bool(object as! Int)
            }
        }
        if object is Float {
            return Bool(Int(object as! Float))
        }
        if object is Double {
            return Bool(Int(object as! Double))
        }
        if object is String {
            if (object as! String).isEmpty ||  (object as! String) == "" {
                return false
            }
            if self.getValidIntFromObject(object)>0 {
                return true
            }
            else {
                return false
            }
        }
        else {
            return false
        }
    }
    class func getValidIntFromObject(_ object:AnyObject?) -> Int {
        if self.isNull(object) {
            return 0
        }
        if object is Int {
            return (object as! Int)
        }
        if object is Float {
            return Int((object as! Float))
        }
        if object is Double {
            return Int((object as! Double))
        }
        if object is String {
            if (object as! String).isEmpty ||  (object as! String) == "" {
                return 0
            }
            if let value = Double(object as! String) {
                if value.isNaN || value.isInfinite || value == 0.0 {
                    return 0
                }
                return Int(value)
            }
            if let value = Float(object as! String) {
                if value.isNaN || value.isInfinite || value == 0.0 {
                    return 0
                }
                return Int(value)
            }
            if let value = Int(object as! String) {
                return value
            }
            else {
                return 0
            }
        }
        if object is Bool {
            if (object as! Bool) {
                return 1
            }
            else {
                return 0
            }
        }
        else {
            return 0
        }
    }
    
    class func getValidFloatFromObject(_ object:AnyObject?) -> Float {
        if self.isNull(object) {
            return 0.00
        }
        if object is Float {
            return (object as! Float)
        }
        if object is Double {
            return Float(object as! Double)
        }
        if object is Int {
            return Float(object as! Int)
        }
        if object is String {
            if (object as! String).isEmpty ||  (object as! String) == "" {
                return 0.00
            }
            if (object as! String) == "N/A" || (object as! String) == "None" {
                return 0.00
            }
            if let returnFloat = Float(object as! String) {
                return returnFloat
            }
            else {
                return 0.00
            }
            //return (object as! String).toFloat()!
        }
        if object is Bool {
            if (object as! Bool) {
                return 1.00
            }
            else {
                return 0.00
            }
        }
        else {
            return 0.00
        }
    }
    
    
    class func getValidDoubleFromObject(_ object:AnyObject?) -> Double {
        if self.isNull(object) {
            return 0.00
        }
        if object is Double {
            return object as! Double
        }
        if object is Int {
            return Double(Float(object as! Int))
        }
        if object is Float {
            return (Double(object as! Float))
        }
        if object is String {
            if (object as! String).isEmpty ||  (object as! String) == "" {
                return 0.00
            }
            if let returnDouble = Double(object as! String) {
                return returnDouble
            }
            else {
                return 0.00
            }
        }
        if object is Bool {
            if (object as! Bool) {
                return 1.00
            }
            else {
                return 0.00
            }
        }
        else {
            return 0.00
        }
        
        
    }
    

    
    
}

extension Bool {
    init(_ number: Int) {
        self.init(truncating: number as NSNumber)
    }
}

