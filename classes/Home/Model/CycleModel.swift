//
//  CycleModel.swift
//  DYZB
//
//  Created by 雷志明 on 2018/12/17.
//  Copyright © 2018年 雷志明. All rights reserved.
//

import UIKit

class CycleModel: NSObject {
    @objc var title : String = ""
    @objc var pic_url : String = ""
    @objc var room : [String : Any]? {
        didSet{
            guard let room = room else { return }
            anchor = AnchorModel(dict: room)
        }
    }
    var anchor : AnchorModel?
    
    init(dict : [String : Any]){
        super.init()
        
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}

}
