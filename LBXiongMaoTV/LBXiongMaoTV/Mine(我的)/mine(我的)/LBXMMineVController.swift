//
//  LBXMMineVController.swift
//  LBXiongMaoTV
//
//  Created by 云媒 on 2017/4/12.
//  Copyright © 2017年 YunMei. All rights reserved.
//

import UIKit

class LBXMMineVController: LBXMBaseVController {

    var loginLabel:UILabel = UILabel()
    
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
        ///表头视图
        addTableHeaderBtn()
        ///导航栏右边的按钮
        addRightBtn()
    }
    func headerButton(){
        print("点击了表头视图")
    }
 
    ///右边按钮点击事件
    func rightItem(){
        let setVC = LBXMMineSetVController()
        setVC.title = "设置"
        navigationController?.pushViewController(setVC, animated: true)
    }
}
extension LBXMMineVController{
    
    func addTableHeaderBtn(){
        let headerBtn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 80))
        headerBtn.backgroundColor = UIColor.white
        headerBtn.addTarget(self, action: #selector(LBXMMineVController.headerButton), for: .touchUpInside)
        baseTableView.tableHeaderView = headerBtn

        let imageIcon = UIImageView.init(image: UIImage.init(named: "LOGO"))
        imageIcon.layer.cornerRadius = 30
        imageIcon.layer.masksToBounds = true
        headerBtn.addSubview(imageIcon)
        imageIcon.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.top.equalTo(10)
            make.bottom.equalTo(-10)
            make.width.equalTo(60)
        }
        ///添加箭头
        let arrowImage = UIImageView.init(image: UIImage.init(named: "arrow_right2"))
        headerBtn.addSubview(arrowImage)
        arrowImage.snp.makeConstraints { (make) in
            make.centerY.equalTo(headerBtn.snp.centerY)
            make.width.equalTo(15)
            make.height.equalTo(15)
            make.right.equalTo(-20)
        }
        ///点击登录
        headerBtn.addSubview(loginLabel)
        loginLabel.font = UIFont.systemFont(ofSize: 15)
        loginLabel.text = "点击登录"
        loginLabel.textColor = UIColor.cz_color(withRed: 69, green: 170, blue: 70)
        loginLabel.textAlignment = .right
        loginLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(headerBtn)
            make.right.equalTo(arrowImage.snp.left).offset(-10)
            make.height.equalTo(15)
            make.width.equalTo(100)
        }
        
    }
    ///导航栏右边的按钮
    func addRightBtn(){
        let customBtn = UIButton.init(type: .custom)
        customBtn.sizeToFit()
        customBtn.setImage(UIImage.init(named: "mine_settingIcon2"), for: .normal)
        customBtn.setImage(UIImage.init(named: "mine_settingIcon2_press"), for: .selected)
        customBtn.addTarget(self, action: #selector(LBXMMineVController.rightItem), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: customBtn)
    }
    ///0组
    func addGroup0(){
        let itemArrowBo = LBXMMineItemArrow.itemWithArrow(icon: "mine_zhubo", title: "我要当主播", vc: "")
        itemArrowBo.itemBlcok = { [weak self] in 
        
            let arrowVC = LBXMMineItemArrowVController()
            arrowVC.title = itemArrowBo.title
            self?.navigationController?.pushViewController(arrowVC, animated: true)
        }
        let group0 = LBXMMineGroup()
        group0.items.append(itemArrowBo)
        groupArray.append(group0)
    }
    ///一组
    func addGroup1(){
        let itemArrowYue = LBXMMineItemArrow.itemWithArrow(icon: "mine_attentionIcon", title: "我的订阅", vc: "")
        let group1 = LBXMMineGroup()
        group1.headerTitle = "订阅"
        group1.footerTitle = "我的"
        group1.items.append(itemArrowYue)
        groupArray.append(group1)
    }
    ///二组
    func addGroup2(){
        let itemArrowKan = LBXMMineItemArrow.itemWithArrow(icon: "mine_histroyIcon", title: "观看历史", vc: "")
        let group2 = LBXMMineGroup()
        group2.footerTitle = "观看"
        group2.items.append(itemArrowKan)
        groupArray.append(group2)
    }
    ///三组
    func addGroup3(){
        let itemArrowXin = LBXMMineItemArrow.itemWithArrow(icon: "mine_message_icon", title: "私信", vc: "Xin")
        let itemArrowYao = LBXMMineItemArrow.itemWithArrow(icon: "shake_icon", title: "摇一摇", vc: "Yao")

        let itemArrowHuo = LBXMMineItemArrow.itemWithArrow(icon: "mine_activityIcon", title: "活动中心", vc: "Huo")

        let itemArrowKai = LBXMMineItemArrow.itemWithArrow(icon: "mine_remindIcon", title: "开播提醒", vc: "")

        let itemArrowYi = LBXMMineItemArrow.itemWithArrow(icon: "mine_suggestIcon", title: "意见反馈", vc: "")
        let group3 = LBXMMineGroup()
        group3.items.append(itemArrowXin)
        group3.items.append(itemArrowYao)
        group3.items.append(itemArrowHuo)
        group3.items.append(itemArrowKai)
        group3.items.append(itemArrowYi)

        groupArray.append(group3)
    }
}
