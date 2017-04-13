//
//  LBXMGameItemVController.swift
//  LBXiongMaoTV
//
//  Created by 云媒 on 2017/4/13.
//  Copyright © 2017年 YunMei. All rights reserved.
//

import UIKit
import Alamofire
///间隔
let itemMargin:CGFloat = 4
let itemWidth = (UIScreen.cz_screenWidth() - itemMargin * 3)/2
let itemHeight = itemWidth / 2

class LBXMGameItemVController: UIViewController {
    ///集合视图
    lazy var gameItemCollectionView:UICollectionView = {
    
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: itemWidth, height: 90)
        layout.minimumLineSpacing = itemMargin
        layout.minimumInteritemSpacing = itemMargin
        layout.sectionInset = UIEdgeInsets.init(top: itemMargin, left: itemMargin, bottom: itemMargin, right: itemMargin)
        let gameItemCollectionView = UICollectionView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: UIScreen.cz_screenHeight()), collectionViewLayout: layout)
            gameItemCollectionView.delegate = self
            gameItemCollectionView.dataSource = self
            gameItemCollectionView.register(LBXMGameItemCell.self, forCellWithReuseIdentifier: "GameItemCell")
        return gameItemCollectionView
    }()
    ///模型数组
    lazy var gameItemArray:[LBXMGameModel] = [LBXMGameModel]()
    var cate:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ///UI
        addUI()
        ///加载数据
        addData()
    }
}
extension LBXMGameItemVController{

    func addUI(){
        gameItemCollectionView.backgroundColor = UIColor.cz_color(withRed: 244, green: 244, blue: 244)
        view.addSubview(gameItemCollectionView)
    }
    func addData(){
     
        Alamofire.request("http://api.m.panda.tv/ajax_get_live_list_by_cate?cate=\(cate)&pageno=1&pagenum=20&order=person_num&status=2&__version=1.1.7.1305&__plat=ios&__channel=appstore", method: .get, parameters: nil).responseJSON { (response) in
            print(response)
            guard let result = response.result.value as?[String:AnyObject],
            let data = result["data"]as?[[String:AnyObject]] else{
                return
            }
            for dic in data{
            
              let gameItemModel = LBXMGameModel()
                gameItemModel.yy_modelSet(with: dic)
                self.gameItemArray.append(gameItemModel)
            }
            self.gameItemCollectionView.reloadData()
        }
    }
}

extension LBXMGameItemVController:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameItemArray.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let gameItemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameItemCell", for: indexPath) as? LBXMGameItemCell
        
        return gameItemCell!
    }

}
