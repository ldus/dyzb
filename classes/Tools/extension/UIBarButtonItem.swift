//
//  File.swift
//  DYZB
//
//  Created by 雷志明 on 2018/11/30.
//  Copyright © 2018年 雷志明. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    convenience init(imageName : String , highImageName : String = "" , size : CGSize = CGSize.zero) {
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), for: .normal)
        if highImageName != "" {
            btn.setImage(UIImage(named: imageName), for: .highlighted)
        }
        if size == CGSize.zero{
            btn.sizeToFit()
        }else{
            btn.frame = CGRect(origin: CGPoint.zero, size: size)
        }
        self.init(customView : btn )
    }
}
