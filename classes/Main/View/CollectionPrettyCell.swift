//
//  CollectionPrettyCell.swift
//  DYZB
//
//  Created by 雷志明 on 2018/12/12.
//  Copyright © 2018年 雷志明. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionPrettyCell: CollectionBaseCell {
    @IBOutlet weak var cityBtn: UIButton!
    
    override var anchor : AnchorModel? {
        didSet{
            super.anchor = anchor
            cityBtn.setTitle(anchor?.anchor_city, for: .normal)
           
        }
    }

}
