//
//  LBXMGameViewModel.swift
//  LBXiongMaoTV
//
//  Created by 云媒 on 2017/4/13.
//  Copyright © 2017年 YunMei. All rights reserved.
//

import UIKit

class LBXMGameViewModel: NSObject {
    ///模型数组
    lazy var gameModelArray:[LBXMGameModel] = [LBXMGameModel]()
    ///游戏
    func gameViewModelBlock( completion:@escaping (_ resultArray:[LBXMGameModel])->()){
        
        LBXMNetWork.netWorkRequest(requestType: .GET, urlString: "http://api.m.panda.tv/index.php", pragrams: ["method":"category.list", "type":"game", "__version":"1.1.7.1305", "__plat":"ios", "__channel":"appstore"]) { (result) in
            
            print(result)
            guard let result = result as?[String:AnyObject],
                  let data = result["data"] as?[[String:AnyObject]] else{
               return
            }
            
            for dic in data{
              let lbxmGameModel = LBXMGameModel()
                lbxmGameModel.yy_modelSet(with: dic)
                self.gameModelArray.append(lbxmGameModel)
            }
            completion(self.gameModelArray)
        }
    }
    
}
