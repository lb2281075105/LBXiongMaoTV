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

class LBXMHomeTitleView: UIView {
    ///按钮数组
    var titleButtonArray:[UIButton] = [UIButton]()
    ///指示器视图
    let indicatorV:UIView = {
        //cz_color(withRed: 111, green: 197, blue: 153)
        let indicatorView = UIView()
        indicatorView.backgroundColor = UIColor.red
        return indicatorView
    }()
    ///标题滑动视图
    let titleScrollView:UIScrollView = {
        
        let titleScrollView = UIScrollView()
        titleScrollView.contentSize = CGSize.init(width: titleWidth * CGFloat(titleArray.count), height: titleHeight)
        titleScrollView.showsHorizontalScrollIndicator = false
        titleScrollView.scrollsToTop = false
        titleScrollView.isPagingEnabled = false
        titleScrollView.bounces = false
        return titleScrollView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(titleScrollView)
        titleScrollView.frame = self.bounds
        ///添加标题栏视图
        addHomeTitleScrollView()
        ///指示器视图 cz_color(withRed: 111, green: 197, blue: 153)
        indicatorV.height = 4
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    ///按钮点击事件
    func titleBtnClick(sender:UIButton){
 
        for btn in titleButtonArray {
            btn.isSelected = false
            btn.isUserInteractionEnabled = true
        }
        
        titleButtonArray[sender.tag].isSelected = true
        titleButtonArray[sender.tag].isUserInteractionEnabled = false
        
        UIView.animate(withDuration: 0.25) { 
          self.indicatorV.centerX = self.titleButtonArray[sender.tag].centerX
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
            titleBtn.backgroundColor = UIColor.cz_random()
            titleBtn.setTitle(titleSting, for: .normal)
            titleBtn.setTitleColor(UIColor.cz_color(withRed: 127, green: 127, blue: 127), for: .normal)
            titleBtn.setTitleColor(UIColor.cz_color(withRed: 111, green: 197, blue: 153), for: .selected)
                
            titleBtn.tag = index
            indicatorV.frame.origin.y = 40 - 4
            titleButtonArray.append(titleBtn)
            titleScrollView.addSubview(titleBtn)
            ///默认选中第一个按钮
            if index == 0 {
                titleBtn.isUserInteractionEnabled = false
                titleBtn.isSelected = true
                
                indicatorV.centerX = titleBtn.centerX
                indicatorV.width = (titleBtn.titleLabel?.width)!
                titleBtn.addSubview(indicatorV)
                
                print(indicatorV.centerX)
            }
            
        }
        
    }

}
