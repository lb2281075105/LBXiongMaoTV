//
//  LBXMTabBarVController.swift
//  LBXiongMaoTV
//
//  Created by 云媒 on 2017/4/11.
//  Copyright © 2017年 YunMei. All rights reserved.
//

import UIKit

class LBXMTabBarVController: UITabBarController {
    ///在这哥方法中只执行一次 --- OC的方法
    override class func initialize(){
      UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.cz_color(withRed: 87, green: 206, blue: 138)], for: .selected)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        ///添加子控制器
        addChildViewControllers()
        ///在标签栏上面添加视图
        addTabBarView()
    }
    func addTabBarView(){
      let tabBarView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 49))
      tabBarView.backgroundColor = UIColor.white
      tabBar.insertSubview(tabBarView, at: 0)
    }

    ///添加子控制器
    func addChildViewControllers(){
        addOneChildController(title: "首页", imageName: "menu_homepage_nor", selectImageName: "menu_homepage_sel", viewController: LBXMHomeVController())
        addOneChildController(title: "游戏", imageName: "menu_youxi_nor", selectImageName: "menu_youxi_sel", viewController: LBXMGameVController())
        addOneChildController(title: "娱乐", imageName: "menu_yule_nor", selectImageName: "menu_yule_sel", viewController: LBXMYuLeVController())
        addOneChildController(title: "小葱秀", imageName: "menu_goddess_nor", selectImageName: "menu_goddess_sel", viewController: LBXMSmallXiuVController())
        addOneChildController(title: "我的", imageName: "menu_mine_nor", selectImageName: "menu_mine_sel", viewController: LBXMMineVController())
    
    }
}

extension LBXMTabBarVController{
    ///添加子控制器
    func addOneChildController(title:String,imageName:String,selectImageName:String,viewController:UIViewController){
        ///为标签栏Item设置属性值
        viewController.tabBarItem.title = title
        viewController.title = title
        viewController.tabBarItem.image = UIImage.init(named: imageName)
        viewController.tabBarItem.selectedImage = UIImage.init(named: selectImageName)
        ///添加导航控制器
        let lbxbNav = LBXMNavVController.init(rootViewController: viewController)
        addChildViewController(lbxbNav)
    }

}
