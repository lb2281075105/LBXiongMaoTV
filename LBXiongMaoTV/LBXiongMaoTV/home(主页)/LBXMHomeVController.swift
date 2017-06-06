//
//  LBXMHomeVController.swift
//  LBXiongMaoTV
//
//  Created by 云媒 on 2017/4/12.
//  Copyright © 2017年 YunMei. All rights reserved.
//

import UIKit
///滑动视图下方视图height
private let titleViewHeight:CGFloat = 40
///导航条高度
private let navBarHeight:CGFloat = 64
///子控制器
private let childControllers:Array<String> = ["LBXMPerfectController","LBXMLegendController","LBXMLiveController","LBXMXiuController","LBXMHeroController","LBXMGameController"]

class LBXMHomeVController: UIViewController {
    
    ///滑动视图下方视图
    lazy var titleView:LBXMHomeTitleView = {
        
        let titleView = LBXMHomeTitleView.init(frame: CGRect.init(x: 0, y: navBarHeight, width: UIScreen.cz_screenWidth(), height: titleViewHeight))

        return titleView
    }()
    ///添加滑动视图
    lazy var scrollView:UIScrollView = {
    
        let scrollView = UIScrollView()
        scrollView.frame = CGRect.init(x: 0, y: navBarHeight + titleViewHeight, width: UIScreen.cz_screenWidth(), height: UIScreen.cz_screenHeight() - navBarHeight - titleViewHeight)
        scrollView.contentSize = CGSize.init(width: UIScreen.cz_screenWidth() * CGFloat(childControllers.count), height: 0)
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = false
        scrollView.alwaysBounceHorizontal = true
        scrollView.alwaysBounceVertical = false
        
        return scrollView;
    
    }()
    ///滑动滑动视图使上面的标题按钮移动 -- block属性
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ///添加导航栏标题
        addTitleImage()
        ///这个属性很重要   MARK  ------ 如果不设置这个属性，那么scrollView会根据status bar:navigationbar，与tabbar的高度，自动调整scrollview的 inset
        automaticallyAdjustsScrollViewInsets = false
        view.addSubview(titleView)
        ///添加滑动视图
        addScrollView()
        ///添加子控制器以及子控制器的视图 ---- 父子控制器
        setUpChildControllers()
        ///点击标题按钮回调，使下方滑动视图滑动
        setUpBlockCallBack()
    }

}
extension LBXMHomeVController{
     ///添加导航栏标题
    func addTitleImage(){
        
        navigationItem.titleView = UIImageView.init(image: UIImage.init(named: "title_image"))
    }
    ///添加滑动视图
    func addScrollView(){
        view.addSubview(scrollView)
    }
    ///添加子控制器以及子控制器的视图 ---- 父子控制器
    func setUpChildControllers(){
        
        for (index,childString) in childControllers.enumerated() {
            ///命名空间
            guard let childC = NSClassFromString(Bundle.main.namespace + "." + childString),
                  let childClassType = childC as?UIViewController.Type else {
                return
            }
            ///获取 ”字符串“ 对应的 “子控制器类”
            let childVC = childClassType.init()
            childVC.view.frame = CGRect.init(x: CGFloat(index) * UIScreen.cz_screenWidth(), y: 0, width: UIScreen.cz_screenWidth(), height: scrollView.height)
            childVC.view.backgroundColor = UIColor.cz_random()
            ///添加子控制器以及子控制器的视图
            scrollView.addSubview(childVC.view)
            addChildViewController(childVC)
            print(index,childString)
        }
    }
    func setUpBlockCallBack(){
        titleView.btnClickBlock = { [weak self](index:NSInteger) in
            
            self?.scrollView.setContentOffset(CGPoint.init(x: CGFloat(index) * UIScreen.cz_screenWidth(), y: 0), animated: true)
        }
    
    }
    
}

extension LBXMHomeVController:UIScrollViewDelegate{

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        ///判断页数
        let page = scrollView.contentOffset.x / (UIScreen.cz_screenWidth())
        
        print("滑动第 \(page) 页")
        ///滑动下方滑动视图使标题按钮一起滑动
        titleView.addScrollViewTitleBtnScroll(page)
    }

}
