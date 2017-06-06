//
//  LBXMHomeTitleView.swift
//  LBXiongMaoTV
//
//  Created by 云媒 on 2017/4/18.
//  Copyright © 2017年 YunMei. All rights reserved.
//

import UIKit
///标题
private let titleArray = ["精彩推荐","全部直播","英雄联盟","主机游戏","炉石传说","熊猫星秀"]
///标题宽度
private let titleWidth = UIScreen.cz_screenWidth() / 3.0
///标题高度
private let titleHeight:CGFloat = 40
///点击标题按钮滑动下方子控制器 --- block
typealias titleViewBtnClick = (_ index:NSInteger) -> ()
class LBXMHomeTitleView: UIView {
    ///按钮数组
    var titleButtonArray:[UIButton] = [UIButton]()
    ///指示器视图
    lazy var indicatorV:UIView = {
        let indicatorView = UIView()
        indicatorView.backgroundColor = UIColor.cz_color(withRed: 111, green: 197, blue: 153)
        return indicatorView
    }()
    ///标题滑动视图
    lazy var titleScrollView:UIScrollView = {
        
        let titleScrollView = UIScrollView()
        titleScrollView.contentSize = CGSize.init(width: titleWidth * CGFloat(titleArray.count), height: titleHeight)
        titleScrollView.showsHorizontalScrollIndicator = false
        titleScrollView.scrollsToTop = false
        titleScrollView.isPagingEnabled = false
        titleScrollView.bounces = false
        return titleScrollView
    }()
    ///block属性
    var btnClickBlock:titleViewBtnClick?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        ///指示器视图
        indicatorV.height = 4
        addSubview(titleScrollView)
        titleScrollView.frame = self.bounds
        ///添加标题栏视图
        addHomeTitleScrollView()
//        ///滑动下方滑动视图使标题按钮一起滑动
//        addScrollViewTitleBtnScroll()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    ///按钮点击事件
    func titleBtnClick(sender:UIButton){
        translationToCenter(sender: sender)
        for btn in titleButtonArray {
            //btn.isSelected = false
            //btn.isUserInteractionEnabled = true
            btn.isEnabled = true
        }
        
        //titleButtonArray[sender.tag].isSelected = true
        //titleButtonArray[sender.tag].isUserInteractionEnabled = false
        titleButtonArray[sender.tag].isEnabled = false
        UIView.animate(withDuration: 0.25) {
          self.indicatorV.centerX = self.titleButtonArray[sender.tag].centerX
        }
    }
    ///让标题按钮自动居中（如果按钮的中心点 > 屏幕的中心点则将按钮中心点偏移）
    func translationToCenter(sender:UIButton){
        var offsetX = sender.centerX - UIScreen.cz_screenWidth() / 2.0
        let maxOffsetX = titleScrollView.contentSize.width - UIScreen.cz_screenWidth()
        ///print("按钮中心点：%f,\n偏移量：%f,\n最大偏移量：%f\n",sender.centerX,offsetX,maxOffsetX)
        if offsetX < 0 {
            offsetX = 0
        }
        if offsetX > maxOffsetX{
            ///当处于最后一个标题按钮并且maxOffsetX > 0 的时候，为防止被最右边添加按钮挡住，需要增加一个偏移
            if sender.tag == (self.titleButtonArray.count) {
                if maxOffsetX > 0 {
                    offsetX = maxOffsetX + 40
                }
            }else{
                if sender.tag != 0 {
                    offsetX = maxOffsetX
                }
            }
        }

        titleScrollView.setContentOffset(CGPoint.init(x: offsetX, y: 0), animated: true)
        ///回调
        if (btnClickBlock != nil) {
            btnClickBlock!(sender.tag)
        }
    }
 
}

extension LBXMHomeTitleView{

    ///添加标题栏视图
    func addHomeTitleScrollView(){
        for (index,titleSting) in titleArray.enumerated() {
            let titleBtn = UIButton.init(type: .custom)
            titleBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            titleBtn.frame = CGRect.init(x: titleWidth * CGFloat(index), y: 0, width: titleWidth, height: titleHeight)
            titleBtn.addTarget(self, action: #selector(LBXMHomeTitleView.titleBtnClick(sender:)), for: .touchUpInside)
            titleBtn.setTitle(titleSting, for: .normal)
            titleBtn.setTitleColor(UIColor.cz_color(withRed: 127, green: 127, blue: 127), for: .normal)
            titleBtn.setTitleColor(UIColor.cz_color(withRed: 111, green: 197, blue: 153), for: .disabled)
                
            titleBtn.tag = index + 88
            indicatorV.frame.origin.y = 40 - 4
            titleButtonArray.append(titleBtn)
            titleScrollView.addSubview(titleBtn)
            ///默认选中第一个按钮
            if index == 0 {
                //titleBtn.isUserInteractionEnabled = false
                //titleBtn.isSelected = true
                titleBtn.isEnabled = false
                titleBtn.titleLabel?.sizeToFit()
                indicatorV.width = titleBtn.titleLabel?.width ?? 0
                indicatorV.centerX = titleBtn.centerX
                //titleBtn.addSubview(indicatorV)
                
                print(indicatorV.frame)
            }
            
        }
        titleScrollView.addSubview(indicatorV)
    }

}

extension LBXMHomeTitleView{
    ///滑动下方滑动视图使标题按钮一起滑动
    func addScrollViewTitleBtnScroll(_ index:CGFloat){
        ///初始化主页控制器
        print(index + 88)
        ///滑到右边时对 `index` 约束 为 `1`
        
        let button = titleScrollView.viewWithTag(Int(index) + 88) as?UIButton
        print(button?.tag ?? 0,Int(index))
        //titleBtnClick(sender: button!)
    }

}
