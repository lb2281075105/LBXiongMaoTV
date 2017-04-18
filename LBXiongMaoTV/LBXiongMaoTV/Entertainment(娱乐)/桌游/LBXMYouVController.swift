//
//  LBXMYouVController.swift
//  LBXiongMaoTV
//
//  Created by 云媒 on 2017/4/17.
//  Copyright © 2017年 YunMei. All rights reserved.
//

import UIKit

class LBXMYouVController: LBXMYuLeBaseVController {

    override func viewDidLoad() {
        super.viewDidLoad()

        ///加载数据
        addData()
    }
}

extension LBXMYouVController{
    ///加载数据
    func addData(){
        lbxmYuleViewModel.youRequest(isLiveData: true) { (resultArray) in
            self.baseModelArray = resultArray
            self.baseCollectionView.reloadData()
        }
    }
}
