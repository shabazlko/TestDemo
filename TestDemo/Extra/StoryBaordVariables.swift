import UIKit
import Foundation
class StoryBoardVariables {
    
    static let storyBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
   
    
    static var topViewController:TopViewController {
        return self.storyBoard.instantiateViewController(withIdentifier: "TopViewController") as! TopViewController
    }
   
    
    static var popularViewController:PopularViewController {
        return self.storyBoard.instantiateViewController(withIdentifier: "PopularViewController") as! PopularViewController
    }
    
}


