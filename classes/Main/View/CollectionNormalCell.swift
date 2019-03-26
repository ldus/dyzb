//
//  CollectionNormalCell.swift
//  DYZB
//
//  Created by 雷志明 on 2018/12/12.
//  Copyright © 2018年 雷志明. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionNormalCell: CollectionBaseCell {
    @IBOutlet weak var roomNameLabel: UILabel!
    
    override var anchor : AnchorModel? {
        didSet{
            super.anchor = anchor
            roomNameLabel.text = anchor?.room_name
        }
    }
    
}
