import UIKit
import SwiftHTTP
import XLPagerTabStrip


class PopularViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       if  MessageConstant.popularListItems.count > 0
       {
         self.popularListItems = MessageConstant.popularListItems
         self.popularTv.reloadData()
        }
       else{
          self.serverCallToPopularList()
        }
      
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        
    }
    func serverCallToPopularList() {
        var params: HTTPParameterProtocol?
        params = []
        let topViewIntractor:TopViewIntractor = TopViewIntractor(param: &params, requestName: TopType.TopList)
        topViewIntractor.delegate = self
    }

    @IBOutlet weak var popularTv: UITableView!
    var itemInfo: IndicatorInfo = "View"
    var popularListItems:[PopularModel] = []
}

extension PopularViewController : IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        if itemInfo.title == "Popular" {
            //self.navigationController?.navigationBar.isHidden = true
            self.navigationController?.navigationItem.title = "Popular"
        }
        return itemInfo
    }
}
extension PopularViewController : FriendsIntractorDelegate {
    func topResponse(errorWhileFetchingData:Bool, requesType:TopType,_ topList:[TopModel],_ popularList:[PopularModel])
    {
        if errorWhileFetchingData
        {
            
        }
        else{
            
            self.popularListItems.append(contentsOf: popularList)
            self.popularTv.reloadData()
        }
    }
}

extension PopularViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return popularListItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:PopularCell = tableView.dequeueReusableCell(withIdentifier: PopularCell.identifierpopularcell, for: indexPath) as! PopularCell
        cell.configureCellData(data: popularListItems[indexPath.row], indexPa: indexPath)
        return cell
        
    }
}
extension PopularViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
}



