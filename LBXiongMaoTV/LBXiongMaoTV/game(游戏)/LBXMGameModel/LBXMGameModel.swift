//
//  LBXMGameModel.swift
//  LBXiongMaoTV
//
//  Created by 云媒 on 2017/4/13.
//  Copyright © 2017年 YunMei. All rights reserved.
//

import UIKit

class LBXMGameModel: NSObject {
    /// ------ 游戏 ------
    var cname: String = ""
    var ename: String = ""
    var img: String	= ""
    var ext: String	= ""
    var status: Int?
    var cdn_rate: Int?
    ///gameItem
    var userinfo:[String:AnyObject]?
    var pictures:[String:AnyObject]?
    var person_num:Int = 0
    var name:String = ""
    
    var nickName: String = ""
    var rid: Int = 0
    var avatar: String	= ""
    var userName: String = ""

    
}
