//
//  LBXMPetVController.swift
//  LBXiongMaoTV
//
//  Created by 云媒 on 2017/4/17.
//  Copyright © 2017年 YunMei. All rights reserved.
//

import UIKit

class LBXMPetVController: LBXMYuLeBaseVController {

    override func viewDidLoad() {
        super.viewDidLoad()

        ///加载数据
        addData()
    }
}

extension LBXMPetVController{
    ///加载数据
    func addData(){
        lbxmYuleViewModel.petRequest(isLiveData: true) { (resultArray) in
            self.baseModelArray = resultArray
            self.baseCollectionView.reloadData()
        }
    }
}
