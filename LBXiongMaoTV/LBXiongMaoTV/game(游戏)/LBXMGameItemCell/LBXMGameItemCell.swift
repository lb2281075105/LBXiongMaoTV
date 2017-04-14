//
//  LBXMGameItemCell.swift
//  LBXiongMaoTV
//
//  Created by 云媒 on 2017/4/13.
//  Copyright © 2017年 YunMei. All rights reserved.
//

import UIKit

class LBXMGameItemCell: UICollectionViewCell {

    var imageView:UIImageView!
    var userName:UILabel!
    var personNum:UILabel!
    var nickName:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        ///图片
        imageView = UIImageView()
        addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.top.equalTo(self)
            make.right.equalTo(self)
            make.left.equalTo(self)
            make.height.equalTo(70)
        }
        ///nickName
        nickName = UILabel()
        nickName.textColor = UIColor.white
        nickName.font = UIFont.systemFont(ofSize: 10)
        addSubview(nickName)
        nickName.snp.makeConstraints { (make) in
            make.right.equalTo(imageView.snp.right).offset(0)
            make.left.equalTo(imageView.snp.left).offset(5)
            make.bottom.equalTo(imageView.snp.bottom).offset(0)
            make.height.equalTo(10)
        }
        ///用户名
        userName = UILabel()
        userName.font = UIFont.systemFont(ofSize: 12)
        addSubview(userName)
        userName.snp.makeConstraints { (make) in
            make.right.equalTo(self).offset(60)
            make.bottom.equalTo(self)
            make.left.equalTo(5)
            make.top.equalTo(imageView.snp.bottom)
        }
        ///数量
        personNum = UILabel()
        personNum.textColor = UIColor.red
        personNum.textAlignment = .right
        personNum.font = UIFont.systemFont(ofSize: 11)
        addSubview(personNum)
        personNum.snp.makeConstraints { (make) in
            make.right.equalTo(self)
            make.top.equalTo(imageView.snp.bottom)
            make.bottom.equalTo(self)
            make.width.equalTo(60)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var gamItemModel:LBXMGameModel?{
    
        didSet{
            guard let url = URL.init(string: gamItemModel?.pictures?["img"] as! String) else {
                return
            }
            imageView.kf.setImage(with: url)
            userName.text = gamItemModel?.userinfo?["nickName"] as? String
            nickName.text = gamItemModel?.name
            ///数量
            guard let count = gamItemModel?.person_num else {
                return
            }
            if count > 10000 {
                personNum.text = String.init(format: "%.1f万", Float((gamItemModel?.person_num ?? 0))/10000)
            }else{
                personNum.text = String.init(format: "%d", (gamItemModel?.person_num) ?? 0)
            }
            
        }
    }

}
