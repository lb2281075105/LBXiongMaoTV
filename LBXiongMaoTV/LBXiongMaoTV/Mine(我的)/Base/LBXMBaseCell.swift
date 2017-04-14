//
//  LBXMBaseCell.swift
//  LBXiongMaoTV
//
//  Created by 云媒 on 2017/4/14.
//  Copyright © 2017年 YunMei. All rights reserved.
//

import UIKit

class LBXMBaseCell: UITableViewCell {

    var switchType:UISwitch = UISwitch()
    var labelType:UILabel = UILabel()
    
    class func baseWithCell(tableView:UITableView) -> LBXMBaseCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "BaseCell") as?LBXMBaseCell
        
        if cell == nil {
            cell = LBXMBaseCell.init(style: .default, reuseIdentifier: "BaseCell")
        }
        return cell!
    }
    
    var item:AnyObject?{
    
        didSet{
        
            if (item?.isKind(of: LBXMMineItemArrow.self))! {
                
                let itemArrow = item as?LBXMMineItemArrow
                
                imageView?.image = UIImage.init(named: itemArrow?.imageString ?? "")
                textLabel?.text = itemArrow?.title
                accessoryType = .disclosureIndicator
            }
            
            if (item?.isKind(of: LBXMMineItemSwitch.self))! {
                
                let itemSwitch = item as?LBXMMineItemSwitch
                
                imageView?.image = UIImage.init(named: itemSwitch?.imageString ?? "")
                textLabel?.text = itemSwitch?.title
                selectionStyle = .none
                accessoryView = switchType
            }
            if (item?.isKind(of: LBXMMineItemLabel.self))! {
                
                let itemLabel = item as?LBXMMineItemLabel
                
                imageView?.image = UIImage.init(named: itemLabel?.imageString ?? "")
                textLabel?.text = itemLabel?.title
                labelType.frame = CGRect.init(x: 0, y: 0, width: 100, height: 50)
                labelType.textAlignment = .right
                labelType.text = "1.86MB"
                accessoryView = labelType
            }
            
        }
    
    }
    
    
    
}
