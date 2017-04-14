//
//  LBXMMineItem.swift
//  LBXiongMaoTV
//
//  Created by 云媒 on 2017/4/14.
//  Copyright © 2017年 YunMei. All rights reserved.
//

import UIKit

class LBXMMineItem: NSObject {
    ///图片字符串
    var imageString:String?
    ///标题
    var title:String?
    class func itemWithIcon(icon:String,title:String) -> AnyObject {
        let item = LBXMMineItem()
        item.imageString = icon
        item.title = title
        return item
    }
}
