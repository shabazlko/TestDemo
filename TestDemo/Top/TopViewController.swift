import UIKit
import SwiftHTTP
import XLPagerTabStrip


class TopViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.serverCallToTopList()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
   
    
    func serverCallToTopList() {
        var params: HTTPParameterProtocol?
        params = []
        let topViewIntractor:TopViewIntractor = TopViewIntractor(param: &params, requestName: TopType.TopList)
        topViewIntractor.delegate = self
    }
    




    @IBOutlet weak var topVT: UITableView!
    var itemInfo: IndicatorInfo = "View"
    var topListItems:[TopModel] = []
}

extension TopViewController : IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        if itemInfo.title == "Top" {
            //self.navigationController?.navigationBar.isHidden = true
            self.navigationController?.navigationItem.title = "Top"
        }
        return itemInfo
    }
}


extension TopViewController : FriendsIntractorDelegate {
    func topResponse(errorWhileFetchingData:Bool, requesType:TopType,_ topList:[TopModel],_ popularList:[PopularModel])
    {
        if errorWhileFetchingData
        {
            
        }
        else{
            
            self.topListItems.append(contentsOf: topList)
            self.topVT.reloadData()
        }
    }
}

extension TopViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return topListItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
            let cell:TopCell = tableView.dequeueReusableCell(withIdentifier: TopCell.identifiertopcell, for: indexPath) as! TopCell
            
            cell.configureCellData(data: topListItems[indexPath.row],indexPa:indexPath)
            
            return cell
       
    }
    
    
    
}
extension TopViewController : UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }

}
