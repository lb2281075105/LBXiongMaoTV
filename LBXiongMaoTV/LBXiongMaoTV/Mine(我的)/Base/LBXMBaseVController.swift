//
//  LBXMBaseVController.swift
//  LBXiongMaoTV
//
//  Created by 云媒 on 2017/4/14.
//  Copyright © 2017年 YunMei. All rights reserved.
//

import UIKit

class LBXMBaseVController: UIViewController {
    ///数组
    var groupArray:[LBXMMineGroup] = [LBXMMineGroup]()

    ///表视图
    lazy var baseTableView:UITableView = {
    
        let baseTableView = UITableView.init(frame: CGRect.init(x: 0, y: 10, width: UIScreen.cz_screenWidth(), height: UIScreen.cz_screenHeight() - 10), style: .grouped)
        baseTableView.delegate = self
        baseTableView.dataSource = self
        baseTableView.register(LBXMBaseCell.self, forCellReuseIdentifier: "BaseCell")
        return baseTableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
       view.addSubview(baseTableView)
    }

}

extension LBXMBaseVController:UITableViewDelegate,UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return groupArray[section].items.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return groupArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let baseCell = LBXMBaseCell.baseWithCell(tableView: tableView)
        let group = groupArray[indexPath.section]
        
        baseCell.item = group.items[indexPath.row] as? AnyObject
        
        return baseCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let group = groupArray[indexPath.section]
        let item = group.items[indexPath.row] as?LBXMMineItemLabel
        
        ///block的回调
        if ((item?.blcok) != nil) {
            item?.blcok!()
        }
        ///跳转控制器
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return groupArray[section].headerTitle
    }
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return groupArray[section].footerTitle

    }
}
