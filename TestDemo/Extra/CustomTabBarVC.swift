
import UIKit
import XLPagerTabStrip


class CustomTabBarVC: BaseButtonBarPagerTabStripViewController<YoutubeIconCell> {
    
    @IBOutlet weak var backBarLeftItem: UIBarButtonItem!
    
    let redColor = UIColor(red: 221/255.0, green: 0/255.0, blue: 19/255.0, alpha: 1.0)
    let unselectedIconColor = UIColor(red: 60/255.0, green: 179/255.0, blue: 113/255.0, alpha: 0.5)
    
    var letNavigationController:UINavigationController!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        buttonBarItemSpec = ButtonBarItemSpec.nibFile(nibName: "YoutubeIconCell", bundle: Bundle(for: YoutubeIconCell.self), width: { (cell: IndicatorInfo) -> CGFloat in
            return 50.0
        })
    }
    
    
    
    @IBAction func moveBack(_ sender: Any) {
        self.letNavigationController.popToRootViewController(animated: true)
        //self.parent?.superclass.naviga
        //super.navigationController?.popToRootViewController(animated:true)
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        self.view.layerGradient()
        self.letNavigationController = self.navigationController;
        settings.style.buttonBarBackgroundColor =  .clear //UIColor(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1.0)
        settings.style.buttonBarItemBackgroundColor = .clear
        settings.style.selectedBarBackgroundColor =  UIColor.colorWithHexString("24B0A8")//UIColor(red: 234/255.0, green: 234/255.0, blue: 234/255.0, alpha: 1.0)
        settings.style.selectedBarHeight = 2
        settings.style.buttonBarMinimumLineSpacing = 0.5
        settings.style.buttonBarItemTitleColor = UIColor.colorWithHexString("24B0A8")
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        
        changeCurrentIndexProgressive = { [weak self] (oldCell: YoutubeIconCell?, newCell: YoutubeIconCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.backgroundColor = UIColor.colorWithHexString("FFFFFF")
            newCell?.backgroundColor = UIColor.colorWithHexString("37A6E1")
        }
        super.viewDidLoad()
        
    
       
    }
    
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - PagerTabStripDataSource
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        //let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let arraysVC :  [UIViewController]
        arraysVC =  self.getTabForPermission()
        return arraysVC
    }
    
    
    func getTabForPermission() -> [UIViewController] {
        
        var arraysVC :  [UIViewController] = NSMutableArray() as! [UIViewController]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        var child_1 : TopViewController{
            let child_1 = storyboard.instantiateViewController(withIdentifier: String(describing: "TopViewController")) as! TopViewController
            child_1.itemInfo = IndicatorInfo(title: "Top", image: UIImage(named: "exercisebuddyimg"))
            
            return child_1
        }
        
        var child_2 : PopularViewController{
            let child_2 = storyboard.instantiateViewController(withIdentifier: String(describing: "PopularViewController")) as! PopularViewController
            child_2.itemInfo = IndicatorInfo(title: "Popular", image: UIImage(named: "friendsimg"))
            return child_2
        }
        arraysVC.append(child_1)
        arraysVC.append(child_2)
        
        return arraysVC
    }
    
    
    override func configure(cell: YoutubeIconCell, for indicatorInfo: IndicatorInfo) {
       // cell.iconImage.image = indicatorInfo.image?.withRenderingMode(.alwaysTemplate)
        
        if indicatorInfo.title == "Top" {
            cell.iconTitle.text = "Top"
        }
        if indicatorInfo.title == "Popular" {
            cell.iconTitle.text = "Popular"
        }
    }
    
    override func updateIndicator(for viewController: PagerTabStripViewController, fromIndex: Int, toIndex: Int, withProgressPercentage progressPercentage: CGFloat, indexWasChanged: Bool) {
        super.updateIndicator(for: viewController, fromIndex: fromIndex, toIndex: toIndex, withProgressPercentage: progressPercentage, indexWasChanged: indexWasChanged)
    }
}



