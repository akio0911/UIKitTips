// Gradient View
// UIKitじゃなくて、QuartzCoreだけど・・・😅

import UIKit
import XCPlayground

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        
        gradient.colors = [(1,0,0), (0,1,0), (0,0,1)].map{
            UIColor(red: $0.0, green: $0.1, blue: $0.2, alpha: 0.6).CGColor
        }
        
        gradient.startPoint = CGPointMake(0.0, 0.0)
        gradient.endPoint = CGPointMake(1.0, 1.0)
        
        gradient.locations = [0.0, 0.5, 1.0].map{ NSNumber(float: $0) }
        
        self.view.layer.insertSublayer(gradient, atIndex: 0)
    }
}

XCPlaygroundPage.currentPage.liveView = ViewController()

