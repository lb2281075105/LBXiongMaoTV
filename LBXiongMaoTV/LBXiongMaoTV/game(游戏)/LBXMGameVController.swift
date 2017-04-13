//
//  LBXMGameVController.swift
//  LBXiongMaoTV
//
//  Created by 云媒 on 2017/4/12.
//  Copyright © 2017年 YunMei. All rights reserved.
//

import UIKit
///item之间的间隔
private let gameItemMargin:CGFloat = 4
///item的宽度
private let gameItemWidth = (UIScreen.cz_screenWidth() - gameItemMargin * 4)/3
///item的高度
private let gameItemHeight = gameItemWidth / 2

class LBXMGameVController: UIViewController {

    ///游戏数组模型
    lazy var gameModelArray:[LBXMGameModel] = [LBXMGameModel]()
    ///游戏视图模型
    lazy var lbxmGameViewModel:LBXMGameViewModel = LBXMGameViewModel()
    ///创建集合视图
    lazy var lbxmGameCollectionView:UICollectionView = {
    
        let lbxmGameLayout = UICollectionViewFlowLayout()
        lbxmGameLayout.itemSize = CGSize.init(width: gameItemWidth, height: 150)
        ///水平间距
        lbxmGameLayout.minimumInteritemSpacing = gameItemMargin
        ///垂直
        lbxmGameLayout.minimumLineSpacing = gameItemMargin
        lbxmGameLayout.sectionInset = UIEdgeInsets.init(top: gameItemMargin, left: gameItemMargin, bottom: gameItemMargin, right: gameItemMargin)
        let lbxmGameCollectionView = UICollectionView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: UIScreen.cz_screenHeight()), collectionViewLayout: lbxmGameLayout)
            lbxmGameCollectionView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
            lbxmGameCollectionView.delegate = self
            lbxmGameCollectionView.dataSource = self
            lbxmGameCollectionView.register(LBXMGameCell.self, forCellWithReuseIdentifier: "GameCell")
//                .register(LBXMGameCell.self, forCellWithReuseIdentifier: "GameCell")
        return lbxmGameCollectionView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        ///布局集合视图
        addUI()
        ///加载数据
        addGameData()
    }

}

extension LBXMGameVController{
    ///布局集合视图
    func addUI(){
        lbxmGameCollectionView.backgroundColor = UIColor.cz_color(withRed: 244, green: 244, blue: 244)

        view.addSubview(lbxmGameCollectionView)
    }
    func addGameData(){
        lbxmGameViewModel.gameViewModelBlock { (gameArry) in
            print("游戏：\(gameArry)")
            self.gameModelArray = gameArry
            self.lbxmGameCollectionView.reloadData()
        }
    }
}
extension LBXMGameVController:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.gameModelArray.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let gameCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCell", for: indexPath) as?LBXMGameCell
        gameCell?.backgroundColor = UIColor.white
        gameCell?.gameModel = self.gameModelArray[indexPath.row]
        return gameCell!
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        let gameItemVC = LBXMGameItemVController()
        gameItemVC.cate = self.gameModelArray[indexPath.row].ename
        gameItemVC.title = self.gameModelArray[indexPath.row].cname
        navigationController?.pushViewController(gameItemVC, animated: true)
    }

}
