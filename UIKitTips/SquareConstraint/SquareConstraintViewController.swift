//
//  SquareConstraintViewController.swift
//  UIKitTips
//
//  Created by akio0911 on 2016/05/22.
//  Copyright © 2016年 akio0911. All rights reserved.
//

import UIKit

// 上下のラベルのContent Hugging Priorityは251。
// 正方形のViewが大きくなろうとするWidth制約のPriorityは249に設定。
// これにより、正方形のビューは上下のビューを押しつぶすほどには拡大されなくなる。

class SquareConstraintViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
