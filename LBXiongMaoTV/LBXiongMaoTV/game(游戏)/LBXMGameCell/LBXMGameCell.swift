//
//  LBXMGameCell.swift
//  LBXiongMaoTV
//
//  Created by 云媒 on 2017/4/13.
//  Copyright © 2017年 YunMei. All rights reserved.
//

import UIKit
import Kingfisher
class LBXMGameCell: UICollectionViewCell {
    ///图片
    var imageView:UIImageView?
    ///文字
    var labelName:UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        ///图片
        imageView = UIImageView.init()
        addSubview(imageView!)
        imageView?.snp.makeConstraints({ (make) in
            make.top.equalTo(self)
            make.right.equalTo(self)
            make.left.equalTo(self)
            make.height.equalTo(120)
        })
        ///文字
        labelName = UILabel()
        labelName?.textAlignment = .center
        labelName?.font = UIFont.systemFont(ofSize: 12)
        addSubview(labelName!)
        labelName?.snp.makeConstraints({ (make) in
            make.bottom.equalTo(self)
            make.right.equalTo(self)
            make.left.equalTo(self)
            make.height.equalTo(30)
        })

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var gameModel:LBXMGameModel?{
    
        didSet{
            guard let iconImage = URL.init(string: gameModel?.img ?? "") else {
                return
            }
            imageView?.kf.setImage(with: iconImage)
            labelName?.text = gameModel?.cname
        }
    }

}
