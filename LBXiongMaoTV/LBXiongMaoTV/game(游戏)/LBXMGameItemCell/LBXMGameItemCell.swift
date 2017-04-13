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
    var labelName:UILabel!
    var labelCount:UILabel!
    var labelNickName:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var gamItemModel:LBXMGameModel?{
    
        didSet{
        
         
        }
    }

}
