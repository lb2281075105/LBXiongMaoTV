//
//  LBXMMineItemArrow.swift
//  LBXiongMaoTV
//
//  Created by 云媒 on 2017/4/14.
//  Copyright © 2017年 YunMei. All rights reserved.
//

import UIKit

class LBXMMineItemArrow: NSObject {
    ///跳转控制器
    var vc:String = ""
    ///图片字符串
    var imageString:String?
    ///标题
    var title:String?
    
    class func itemWithIcon(icon:String,title:String,vc:String) -> AnyObject {
        
        let itemArrow = LBXMMineItemArrow()
        itemArrow.imageString = icon
        itemArrow.vc = vc
        itemArrow.title = title
        return itemArrow
    }
    
}
