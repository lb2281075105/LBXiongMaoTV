//
//  LBXMOutdoorVController.swift
//  LBXiongMaoTV
//
//  Created by 云媒 on 2017/4/17.
//  Copyright © 2017年 YunMei. All rights reserved.
//

import UIKit

class LBXMOutdoorVController: LBXMYuLeBaseVController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ///加载数据
        addOutdoorData()
    }
}

extension LBXMOutdoorVController{
    ///加载数据
    func addOutdoorData(){
        lbxmYuleViewModel.outdoorRequest(isLiveData: true) { (resultArray) in
            self.baseModelArray = resultArray
            self.baseCollectionView.reloadData()
        }
    }
}


