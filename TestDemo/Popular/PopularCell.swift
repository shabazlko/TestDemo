

import UIKit
import SDWebImage

class PopularCell: UITableViewCell {
    
    static let identifierpopularcell:String = "PopularCell"
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var headerTitle: CustomUILabel!
    @IBOutlet weak var subTitle: CustomUILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var storeNameLbl: CustomUILabel!
    
    @IBOutlet weak var discountLbl: CustomUILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func configureCellData(data:PopularModel,indexPa:IndexPath) {
        self.headerTitle.text = data.title
        self.subTitle.text = data.title
        self.img.sd_setImage(with: URL(string: (data.picThumb)!), placeholderImage: UIImage(named: "userimage"))
        self.priceLbl.text = data.currentPrice
        self.storeNameLbl.text = data.storeName
        self.discountLbl.text = data.offerPercent
        
    }
}
