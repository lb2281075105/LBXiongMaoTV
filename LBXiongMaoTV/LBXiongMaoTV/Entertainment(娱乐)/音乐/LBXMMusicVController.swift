//
//  LBXMMusicVController.swift
//  LBXiongMaoTV
//
//  Created by 云媒 on 2017/4/17.
//  Copyright © 2017年 YunMei. All rights reserved.
//

import UIKit

class LBXMMusicVController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.yellow
        let label = UILabel.init(frame: CGRect.init(x: 0, y: 100, width: 200, height: 20))
        label.text = "第四页"
        view.addSubview(label)
    }


}
