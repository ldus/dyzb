//
//  UIColor.swift
//  DYZB
//
//  Created by 雷志明 on 2018/12/3.
//  Copyright © 2018年 雷志明. All rights reserved.
//

import UIKit


extension UIColor {
    convenience init(red: CGFloat, green: CGFloat, blue: CGFloat) {
        
        self.init(red: red / 255.0, green: green / 255.0, blue: blue / 255.0,
                  alpha: 1.0)
    }
}
