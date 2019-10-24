import Foundation
import UIKit
class TopModel: NSObject,Codable {
    let idKey = "id"
    let titleKey = "title"
    let picThumbKey = "pic_thumb"
    let currentPriceKey = "current_price"
    let storeKey = "store"
    let offPercentKey = "off_percent"
    var id:Int?
    var title:String?
    var picThumb:String?
    var currentPrice:String?
    var storeName:String?
    var offerPercent:String?

    class func fromDictionary(_ array:NSArray) -> [TopModel] {
        var returnArray:[TopModel] = []
        for item in array {
            returnArray.append(TopModel(dictionary: item as! NSDictionary))
        }
        return returnArray
    }
    init(dictionary: NSDictionary) {
        self.id = ValidDataFormatter.getValidIntFromObject(dictionary[idKey] as AnyObject)
        self.title = ValidDataFormatter.getValidStringFromObject(dictionary[titleKey] as AnyObject)
        self.picThumb = ValidDataFormatter.getValidStringFromObject(dictionary[picThumbKey] as AnyObject)
        self.currentPrice = ValidDataFormatter.getValidStringFromObject(dictionary[currentPriceKey] as AnyObject)
        self.storeName = ValidDataFormatter.getValidStringFromObject(dictionary[storeKey] as AnyObject)
        self.offerPercent = ValidDataFormatter.getValidStringFromObject(dictionary[offPercentKey] as AnyObject)
    }
    
}
