//
//  LBXMYuLeVController.swift
//  LBXiongMaoTV
//
//  Created by 云媒 on 2017/4/12.
//  Copyright © 2017年 YunMei. All rights reserved.
//

import UIKit

class LBXMYuLeVController: UIViewController {
    ///添加标题视图
    lazy var titleView:UIView = {
    
        let titleView = UIView.init(frame: CGRect.init(x: 0, y: 64, width: UIScreen.cz_screenWidth(), height: 40))
        titleView.backgroundColor = UIColor.white
        
        return titleView;
    }()
    ///按钮数组
    lazy var titleBtnArray:[UIButton] = [UIButton]()
    ///滑动视图
    lazy var indicatorView:UIView = {
    
        let indicatorView = UIView()
        indicatorView.backgroundColor = UIColor.cz_color(withRed: 111, green: 197, blue: 153)
        return indicatorView
    }()
    ///滑动视图
    lazy var yuleScrollView:UIScrollView = {
    
        let yuleScrollView = UIScrollView.init(frame: CGRect.init(x: 0, y: 64 + 40, width: UIScreen.cz_screenWidth(), height: UIScreen.cz_screenHeight() - 64 - 40))
        yuleScrollView.contentSize = CGSize.init(width: UIScreen.cz_screenWidth() * 5, height: UIScreen.cz_screenHeight() - 64 - 40)
        yuleScrollView.isScrollEnabled = true
        yuleScrollView.isPagingEnabled = true
        yuleScrollView.bounces = false
        yuleScrollView.delegate = self
        yuleScrollView.alwaysBounceHorizontal = true
        return yuleScrollView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        ///添加标题
        addTitleView()
        addScrollView()
        view.backgroundColor = UIColor.cz_color(withRed: 244, green: 244, blue: 244)
    }
    ///标题按钮点击
    func titleBtnClick(sender:UIButton){
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            sender.isSelected = true
        }
        for titleBtn in titleBtnArray {
            titleBtn.isSelected = false
            titleBtn.isUserInteractionEnabled = true
        }
        ///添加动画
        UIView.animate(withDuration: 0.25) {
        //      ///指示视图宽度
        //let indicatorWidth = UIScreen.cz_screenWidth()/5 - (self.titleBtnArray[0].titleLabel?.frame.minX)! * 2
            //sender.addSubview(self.indicatorView)
            self.indicatorView.centerX = sender.centerX
        }

        titleBtnArray[sender.tag].isSelected = true
        titleBtnArray[sender.tag].isUserInteractionEnabled = false
        ///点击标题按钮使滑动视图滑动
        yuleScrollView.setContentOffset(CGPoint.init(x: UIScreen.cz_screenWidth() * CGFloat(sender.tag), y: 0), animated: true)

        print(sender.tag)
    }
}
extension LBXMYuLeVController{

    ///添加标题
    func addTitleView(){
        
        let titleArray = ["熊猫星秀","户外直播","音乐","萌宠乐园","桌游"]
    
        for index in 0 ..< titleArray.count {
            let titleBtn = UIButton.init(type: .custom)
            titleBtn.tag = index
            titleBtn.setTitle(titleArray[index], for: .normal)
            titleBtn.setTitleColor(UIColor.cz_color(withRed: 108, green: 108, blue: 108), for: UIControlState.normal)
            titleBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            titleBtn.setTitleColor(UIColor.cz_color(withRed: 111, green: 197, blue: 153), for: UIControlState.selected)
            titleBtn.addTarget(self, action: #selector(LBXMYuLeVController.titleBtnClick(sender:)), for: .touchUpInside)
            let titleBtnFrame = UIScreen.cz_screenWidth()/CGFloat(titleArray.count)
            titleBtn.frame = CGRect.init(x: titleBtnFrame * CGFloat(index), y: 0, width: titleBtnFrame, height: 40)
            titleBtnArray.append(titleBtn)
            titleView.addSubview(titleBtn)
            ///设置指示视图
            indicatorView.height = 4
            indicatorView.frame.origin.y = 40 - 4
            if index == 0 {
                titleBtn.isSelected = true
                titleBtn.isUserInteractionEnabled = false
                titleBtn.titleLabel?.sizeToFit()
                indicatorView.width = UIScreen.cz_screenWidth()/5 - 14
                //let indicatorWidth = (titleBtn.titleLabel?.frame.minX)! * 2
                //print("最小宽度：\(titleBtn.titleLabel?.frame.minX)")
                indicatorView.centerX = titleBtn.centerX
                //titleBtn.addSubview(indicatorView)
            }

        }
        view.addSubview(titleView)
        titleView.addSubview(indicatorView)
    }

}
extension LBXMYuLeVController{

    ///添加滑动视图
    func addScrollView(){
        
        ///["熊猫星秀","户外直播","音乐","萌宠乐园","桌游"]
        
        let lbxmVCs = ["LBXMOutdoorVController","LBXMPetVController","LBXMXinXiuVController","LBXMMusicVController","LBXMYouVController"]
        
        for (index,vcString) in lbxmVCs.enumerated() {
            print("index:\(index),vc:\(vcString)")
            ///命名空间
            guard let childVcClass = NSClassFromString(Bundle.main.namespace + "." + vcString),
                let childVcType = childVcClass as? UIViewController.Type else {
                    print("没有获取到对应的class")
                    return 
            }
            //根据类型创建对应的对象
            let vc = childVcType.init()
            ///控制器视图的位置
            vc.view.frame = CGRect.init(x: CGFloat(index) * UIScreen.cz_screenWidth(), y: 0, width: UIScreen.cz_screenWidth(), height: UIScreen.cz_screenHeight() - 64 - 40)
            yuleScrollView.addSubview(vc.view)
            vc.view.backgroundColor = UIColor.cz_random()
            addChildViewController(vc)
        }
        
        view.addSubview(yuleScrollView)
    }
}
extension LBXMYuLeVController:UIScrollViewDelegate{

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("滑动")
        let pageCount = scrollView.contentOffset.x/(UIScreen.cz_screenWidth())
        print("第 \(pageCount) 页")
        btnClick(sender: titleBtnArray[Int(pageCount)])
    }
    
    ///标题按钮点击
    func btnClick(sender:UIButton){
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            sender.isSelected = true
        }
        for titleBtn in titleBtnArray {
            titleBtn.isSelected = false
            titleBtn.isUserInteractionEnabled = true
        }
        ///添加动画
        UIView.animate(withDuration: 0.25) {
            //      ///指示视图宽度
            //let indicatorWidth = UIScreen.cz_screenWidth()/5 - (self.titleBtnArray[0].titleLabel?.frame.minX)! * 2
            //sender.addSubview(self.indicatorView)
            self.indicatorView.centerX = sender.centerX
        }
        titleBtnArray[sender.tag].isSelected = true
        titleBtnArray[sender.tag].isUserInteractionEnabled = false
    }

}
///命名空间
