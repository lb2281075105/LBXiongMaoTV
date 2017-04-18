//
//  LBXMMusicVController.swift
//  LBXiongMaoTV
//
//  Created by 云媒 on 2017/4/17.
//  Copyright © 2017年 YunMei. All rights reserved.
//

import UIKit

class LBXMMusicVController: LBXMYuLeBaseVController {

    override func viewDidLoad() {
        super.viewDidLoad()

        ///加载数据
        addData()
    }
}

extension LBXMMusicVController{
    ///加载数据
    func addData(){
        lbxmYuleViewModel.musicRequest(isLiveData: true) { (resultArray) in
            self.baseModelArray = resultArray
            self.baseCollectionView.reloadData()
        }
    }
}
