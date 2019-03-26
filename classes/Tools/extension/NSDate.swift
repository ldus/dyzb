//
//  NSDate.swift
//  DYZB
//
//  Created by 雷志明 on 2018/12/14.
//  Copyright © 2018年 雷志明. All rights reserved.
//

import Foundation


extension NSDate {
    class func getCurrentTime() -> String {
        let nowDate = NSDate()
        let interval = Int(nowDate.timeIntervalSince1970)
        return "\(interval)"
    }
}
