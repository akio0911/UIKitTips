//
//  ContentInsetTableViewController.swift
//  UIKitTips
//
//  Created by akio0911 on 2016/05/13.
//  Copyright © 2016年 akio0911. All rights reserved.
//

import UIKit

class ContentInsetTableViewController: UITableViewController {
    
    enum CellData {
        case HiddenNav
        case HiddenTab
        case Text(String)
        
        var text: String? {
            switch self {
            case .HiddenNav, HiddenTab: return nil
            case let .Text(text):       return text
            }
        }
        
        var backgroundColor: UIColor {
            switch self {
            case .HiddenNav, .HiddenTab: return UIColor.lightGrayColor()
            case .Text:                  return UIColor.whiteColor()
            }
        }
    }
    
    var cellDatas: [CellData] = []
    
    private var statusAndNavigtationBarHeight: CGFloat {
        var statusHeight: CGFloat {
            return UIApplication.sharedApplication().statusBarFrame.height
        }
        
        var navigationHeight: CGFloat {
            return navigationController!.navigationBar.bounds.height
        }
        
        return statusHeight + navigationHeight
    }

    private var tabBarHeight: CGFloat {
        return tabBarController!.tabBar.bounds.height
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        automaticallyAdjustsScrollViewInsets = false
        
        tableView.scrollIndicatorInsets = UIEdgeInsets(top: statusAndNavigtationBarHeight,
                                                       left: 0,
                                                       bottom: tabBarHeight,
                                                       right: 0)
        cellDatas += [CellData.HiddenNav]
        cellDatas += (1...30).map{ (num: Int) -> CellData in CellData.Text(num.description) }
        cellDatas += [CellData.HiddenTab]
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellDatas.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let cellData = cellDatas[indexPath.row]
        cell.backgroundColor = cellData.backgroundColor
        cell.textLabel?.text = cellData.text

        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch cellDatas[indexPath.row] {
        case .HiddenNav: return statusAndNavigtationBarHeight
        case .HiddenTab: return tabBarHeight
        case .Text:      return 44
        }
    }
}
