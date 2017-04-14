//
//  LBXMMineItemLabel.swift
//  LBXiongMaoTV
//
//  Created by 云媒 on 2017/4/14.
//  Copyright © 2017年 YunMei. All rights reserved.
//

import UIKit
typealias itemBlock = () -> ()
class LBXMMineItemLabel: NSObject {
    var imageString:String = ""
    var title:String = ""
    var vc:String = ""
    ///blcok属性
    var block:itemBlock?
    
    class func itemWithLabel(imageString:String,title:String,vc:String) -> LBXMMineItemLabel{
        let itemLabel = LBXMMineItemLabel()
        itemLabel.imageString = imageString
        itemLabel.title = title
        itemLabel.vc = vc
        return itemLabel
    }
}
