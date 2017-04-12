//
//  LBXMNavVController.swift
//  LBXiongMaoTV
//
//  Created by 云媒 on 2017/4/12.
//  Copyright © 2017年 YunMei. All rights reserved.
//

import UIKit

class LBXMNavVController: UINavigationController {


    override func viewDidLoad() {
        super.viewDidLoad()
        ///设置背景图片
        UINavigationBar.appearance().setBackgroundImage(UIImage.init(named: "navigationbarBackgroundWhite"), for: UIBarMetrics.default)
        //self.interactivePopGestureRecognizer?.delegate = nil

    }
    ///导航右边按钮
    func rightButton(){
        print("右边")
        pushViewController(LBXMSearchVController(), animated: true)
    }
    ///左边按钮
    func leftButton(){
        print("左边")
        self.popViewController(animated: true)
    }
}

extension LBXMNavVController{

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {

        print("push控制器个数：\(self.childViewControllers.count)")
        if self.childViewControllers.count < 1 {
            ///右边按钮的实现
            let rightBtn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 30, height: 30))
            rightBtn.setImage(UIImage.init(named: "searchbutton_nor"), for: .normal)
            rightBtn.addTarget(self, action: #selector(LBXMNavVController.rightButton), for: .touchUpInside)
            
            viewController.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: rightBtn)
        }else{
            ///左边按钮
            let leftBtn = UIButton.init(type: .custom)
            leftBtn.sizeToFit()
            leftBtn.setImage(UIImage.init(named: "setting_back"), for: .normal)
            leftBtn.addTarget(self, action: #selector(LBXMNavVController.leftButton), for: .touchUpInside)
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: leftBtn)
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: true)
        
    }

}
