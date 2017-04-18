//
//  LBXMYuLeViewModel.swift
//  LBXiongMaoTV
//
//  Created by 云媒 on 2017/4/14.
//  Copyright © 2017年 YunMei. All rights reserved.
//

import UIKit

class LBXMYuLeViewModel: NSObject {
    
    ///户外直播
    var outdoorModelArray:[LBXMYuLeModel] = [LBXMYuLeModel]()
    func outdoorRequest(isLiveData:Bool,complete:@escaping (_ resultArray:[LBXMYuLeModel]) -> ()){
        
        LBXMNetWork.netWorkRequest(requestType: .GET, urlString: "http://api.m.panda.tv/ajax_get_live_list_by_cate?cate=hwzb&pageno=1&pagenum=20&order=person_num&status=2&__version=1.1.7.1305&__plat=ios&__channel=appstore") { (result) in
            
            guard let dic = result as? [String : Any],
                let data = dic["data"] as? [String : Any],
                let items = data["items"] as? [[String:AnyObject]] else {
                    return
            }
            print("户外直播：\(items)")
            
            for dic in items {
                let yuleModel = LBXMYuLeModel()
                yuleModel.yy_modelSet(with: dic)
                self.outdoorModelArray.append(yuleModel)
            }
            complete(self.outdoorModelArray)
        }
    }
    ///萌宠乐园
    var petModelArray:[LBXMYuLeModel] = [LBXMYuLeModel]()
    func petRequest(isLiveData:Bool,complete:@escaping (_ resultArray:[LBXMYuLeModel]) -> ()){
        
        LBXMNetWork.netWorkRequest(requestType: .GET, urlString: "http://api.m.panda.tv/ajax_get_live_list_by_cate?cate=pets&pageno=1&pagenum=20&order=person_num&status=2&__version=1.1.7.1305&__plat=ios&__channel=appstore") { (result) in
            
            guard let dic = result as? [String : Any],
                let data = dic["data"] as? [String : Any],
                let items = data["items"] as? [[String:AnyObject]] else {
                    return
            }
            print("萌宠乐园：\(items)")
            
            for dic in items {
                let yuleModel = LBXMYuLeModel()
                yuleModel.yy_modelSet(with: dic)
                self.petModelArray.append(yuleModel)
            }
            complete(self.petModelArray)
        }
    }
    ///熊猫星秀
    ///星秀模型数组
    var xingXiuModelArray:[LBXMYuLeModel] = [LBXMYuLeModel]()
    func xinXiuRequest(isLiveData:Bool,complete:@escaping (_ resultArray:[LBXMYuLeModel]) -> ()){
        
        LBXMNetWork.netWorkRequest(requestType: .GET, urlString: "http://api.m.panda.tv/ajax_get_live_list_by_cate?cate=yzdr&pageno=1&pagenum=20&order=person_num&status=2&__version=1.1.7.1305&__plat=ios&__channel=appstore") { (result) in
            
            guard let dic = result as? [String : Any],
                  let data = dic["data"] as? [String : Any],
            let items = data["items"] as? [[String:AnyObject]] else {
                    return
            }
            print("熊猫星秀：\(items)")

            for dic in items {
                 let yuleModel = LBXMYuLeModel()
                 yuleModel.yy_modelSet(with: dic)
                 self.xingXiuModelArray.append(yuleModel)
            }
            complete(self.xingXiuModelArray)
        }
    }
    ///音乐
    var musicModelArray:[LBXMYuLeModel] = [LBXMYuLeModel]()
    func musicRequest(isLiveData:Bool,complete:@escaping (_ resultArray:[LBXMYuLeModel]) -> ()){
        
        LBXMNetWork.netWorkRequest(requestType: .GET, urlString: "http://api.m.panda.tv/ajax_get_live_list_by_cate?cate=music&pageno=1&pagenum=20&order=person_num&status=2&__version=1.1.7.1305&__plat=ios&__channel=appstore") { (result) in
            
            guard let dic = result as? [String : Any],
                let data = dic["data"] as? [String : Any],
                let items = data["items"] as? [[String:AnyObject]] else {
                    return
            }
            print("音乐：\(items)")
            
            for dic in items {
                let yuleModel = LBXMYuLeModel()
                yuleModel.yy_modelSet(with: dic)
                self.musicModelArray.append(yuleModel)
            }
            complete(self.musicModelArray)
        }
    }
    ///桌游
    var youModelArray:[LBXMYuLeModel] = [LBXMYuLeModel]()
    func youRequest(isLiveData:Bool,complete:@escaping (_ resultArray:[LBXMYuLeModel]) -> ()){
        
        LBXMNetWork.netWorkRequest(requestType: .GET, urlString: "http://api.m.panda.tv/ajax_get_live_list_by_cate?cate=boardgames&pageno=1&pagenum=20&order=person_num&status=2&__version=1.1.7.1305&__plat=ios&__channel=appstore") { (result) in
            
            guard let dic = result as? [String : Any],
                let data = dic["data"] as? [String : Any],
                let items = data["items"] as? [[String:AnyObject]] else {
                    return
            }
            print("桌游：\(items)")
            
            for dic in items {
                let yuleModel = LBXMYuLeModel()
                yuleModel.yy_modelSet(with: dic)
                self.youModelArray.append(yuleModel)
            }
            complete(self.youModelArray)
        }
    }
}
