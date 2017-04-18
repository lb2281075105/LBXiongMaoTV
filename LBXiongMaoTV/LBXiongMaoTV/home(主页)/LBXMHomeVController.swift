//
//  LBXMHomeVController.swift
//  LBXiongMaoTV
//
//  Created by 云媒 on 2017/4/12.
//  Copyright © 2017年 YunMei. All rights reserved.
//

import UIKit

class LBXMHomeVController: UIViewController {
    

    ///滑动视图下方视图
    let titleView:LBXMHomeTitleView = {
        
        let titleView = LBXMHomeTitleView.init(frame: CGRect.init(x: 0, y: 64, width: UIScreen.cz_screenWidth(), height: 40))

        return titleView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ///添加导航栏标题
        addTitleImage()
        ///这个属性很重要   MARK  ------ 如果不设置这个属性，那么scrollView会根据status bar:navigationbar，与tabbar的高度，自动调整scrollview的 inset
        automaticallyAdjustsScrollViewInsets = false
        view.addSubview(titleView)
    }

}
extension LBXMHomeVController{
     ///添加导航栏标题
    func addTitleImage(){
        
        navigationItem.titleView = UIImageView.init(image: UIImage.init(named: "title_image"))
    }

}
