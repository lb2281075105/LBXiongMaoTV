//
//  LBXMYuLeBaseVController.swift
//  LBXiongMaoTV
//
//  Created by 云媒 on 2017/4/18.
//  Copyright © 2017年 YunMei. All rights reserved.
//

import UIKit
///间隔
private let itemMargin:CGFloat = 10
///item宽度
private let itemWidth = (UIScreen.cz_screenWidth() - itemMargin * 3)/2.0
///item高度
private let itemHeight = (itemWidth * 3)/4
class LBXMYuLeBaseVController: UIViewController {
    ///视图模型
    lazy var lbxmYuleViewModel = LBXMYuLeViewModel()
    ///集合视图
    lazy var baseCollectionView:UICollectionView = {

        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: itemWidth, height: itemHeight)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsetsMake(itemMargin, itemMargin, itemMargin, itemMargin)
        let baseCollectionView = UICollectionView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: UIScreen.cz_screenHeight() - 64 - 40 - 49), collectionViewLayout: layout)
        baseCollectionView.register(LBXMYuLeBaseCell.self, forCellWithReuseIdentifier: "YuLeCell")
        baseCollectionView.delegate = self
        baseCollectionView.dataSource = self
        return baseCollectionView
    }()
    ///模型数组
    lazy var baseModelArray:[LBXMYuLeModel] = [LBXMYuLeModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        ///添加集合视图
        print("添加集合视图")
        baseCollectionView.backgroundColor = UIColor.white
        view.addSubview(baseCollectionView)

    }

}
extension LBXMYuLeBaseVController:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(baseModelArray.count)
        return baseModelArray.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let yuleCell = collectionView.dequeueReusableCell(withReuseIdentifier: "YuLeCell", for: indexPath) as?LBXMYuLeBaseCell
        yuleCell?.lbxmBaseModel = baseModelArray[indexPath.row]
        return yuleCell!
    }

}
