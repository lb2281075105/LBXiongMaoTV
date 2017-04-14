//
//  LBXMMineSetVController.swift
//  LBXiongMaoTV
//
//  Created by 云媒 on 2017/4/14.
//  Copyright © 2017年 YunMei. All rights reserved.
//

import UIKit

class LBXMMineSetVController: LBXMBaseVController {

    override func viewDidLoad() {
        super.viewDidLoad()

        ///0组
        addGroup0()
        ///1组
        addGroup1()
        ///2组
        addGroup2()
        ///3组
        addGroup3()
    }

}

extension LBXMMineSetVController{

        func addGroup0(){
            let itemArrowSao = LBXMMineItemArrow.itemWithArrow(icon: "", title: "扫一扫", vc: "")
            let group0 = LBXMMineGroup()
            group0.items.append(itemArrowSao as! LBXMMineItemArrow)
            groupArray.append(group0)
        }

        func addGroup1(){
            let itemArrowMa = LBXMMineItemSwitch.itemWithSwitch(imageString: "", title: "硬件解码", vc: "")
            let group1 = LBXMMineGroup()
            group1.items.append(itemArrowMa)
            groupArray.append(group1)
        }
    
        func addGroup2(){
            let itemArrowQing = LBXMMineItemLabel.itemWithLabel(imageString: "", title: "清除缓存", vc: "")
            itemArrowQing.block = {
              let alert = UIAlertView.init(title: "", message: "你确定清除缓存吗", delegate: nil, cancelButtonTitle: "取消", otherButtonTitles: "确定")
              alert.show()
            }
            let group2 = LBXMMineGroup()
            group2.items.append(itemArrowQing)
            groupArray.append(group2)
        }
    
        func addGroup3(){
            let itemArrowWo = LBXMMineItemArrow.itemWithArrow(icon: "", title: "关于我们", vc: "")
            let group3 = LBXMMineGroup()
            group3.items.append(itemArrowWo)
            groupArray.append(group3)
        }

}
