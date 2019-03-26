//
//  CollectionBaseCell.swift
//  DYZB
//
//  Created by 雷志明 on 2018/12/17.
//  Copyright © 2018年 雷志明. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionBaseCell: UICollectionViewCell {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var onlineBtn: UIButton!
    @IBOutlet weak var nickNameLabel: UILabel!
    
    var  anchor : AnchorModel? {
        didSet{
            guard let anchor = anchor else {return}
            var onlineStr : String = ""
            if anchor.online >= 10000 {
                onlineStr = "\(Int(anchor.online / 10000))万在线"
            }else{
                onlineStr = "\(anchor.online)在线"
            }
            onlineBtn.setTitle(onlineStr, for: .normal)
            nickNameLabel.text = anchor.nickname
            guard let iconURL = NSURL(string: anchor.vertical_src) else {
                return
            }
            iconImageView.kf.setImage(with: ImageResource(downloadURL: iconURL as URL))
        }
    }
}
