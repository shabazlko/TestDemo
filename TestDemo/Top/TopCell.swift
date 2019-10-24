import UIKit
import SDWebImage

class TopCell: UITableViewCell {

    static let identifiertopcell:String = "TopCell"
   
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var headerTitle: CustomUILabel!
    @IBOutlet weak var subHeaderTitle: CustomUILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var discountLbl: CustomUILabel!
    
    @IBOutlet weak var storeNameLbl: CustomUILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    public func configureCellData(data:TopModel,indexPa:IndexPath) {
        self.headerTitle.text = data.title
        self.subHeaderTitle.text = data.title
        self.img.sd_setImage(with: URL(string: (data.picThumb)!), placeholderImage: UIImage(named: "userimage"))
         self.priceLbl.text = data.currentPrice
        self.storeNameLbl.text = data.storeName
        self.discountLbl.text = data.offerPercent
        
    }
}
