//
//  LBXMMineItemSwitch.swift
//  LBXiongMaoTV
//
//  Created by 云媒 on 2017/4/14.
//  Copyright © 2017年 YunMei. All rights reserved.
//

import UIKit

class LBXMMineItemSwitch: NSObject {
    var imageString:String = ""
    var title:String = ""
    var vc:String = ""
    
    class func itemWithSwitch(icon:String,title:String,vc:String) -> LBXMMineItemSwitch{
        let itemSwitch = LBXMMineItemSwitch()
        itemSwitch.imageString = icon
        itemSwitch.title = title
        itemSwitch.vc = vc
        return itemSwitch
    }
}
