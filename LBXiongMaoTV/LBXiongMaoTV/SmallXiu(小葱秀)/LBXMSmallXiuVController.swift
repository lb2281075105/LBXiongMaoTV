//
//  LBXMSmallXiuVController.swift
//  LBXiongMaoTV
//
//  Created by 云媒 on 2017/4/12.
//  Copyright © 2017年 YunMei. All rights reserved.
//

import UIKit

class LBXMSmallXiuVController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ///跳转网址
        addWebView()
    }
}

extension LBXMSmallXiuVController{

    func addWebView(){
        
        let webView = UIWebView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: UIScreen.cz_screenHeight()))
        webView.delegate = self
        let request = URLRequest.init(url: URL.init(string: "http://cong.panda.tv")!)
        webView.loadRequest(request)
        view.addSubview(webView)
    }

}
extension LBXMSmallXiuVController:UIWebViewDelegate{
    ///禁止点击单元格加载直播间
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        ///判断网址有没有 https://m.panda.tv/room.html 有就禁止加载
        if webView.description.contains("https://m.panda.tv/room.html") {
            return false
        }else{
        
            return true
        }
    }


}
