//
//  LBXMNetWork.swift
//  LBXiongMaoTV
//
//  Created by 云媒 on 2017/4/13.
//  Copyright © 2017年 YunMei. All rights reserved.
//

import UIKit
import Alamofire
///枚举
enum HttpRequestType {
    case GET
    case POST
}
///请求类型、url、pragrams
class LBXMNetWork: NSObject {

   class func netWorkRequest(requestType:HttpRequestType,urlString:String,pragrams:[String:AnyObject],completion:@escaping (_ json:AnyObject)->()){
        ///请求数据
        let type = requestType == .GET ? HTTPMethod.get : HTTPMethod.post
            Alamofire.request(urlString, method: type, parameters: pragrams).responseJSON { (response) in
                
                if let result = response.result.value{
                
                    completion(result as AnyObject)
                }
        }
    }
    
}
