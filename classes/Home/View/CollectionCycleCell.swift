//
//  CollectionCycleCell.swift
//  DYZB
//
//  Created by 雷志明 on 2018/12/17.
//  Copyright © 2018年 雷志明. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionCycleCell: UICollectionViewCell {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var cycleModel : CycleModel?{
        didSet{
            titleLabel.text = cycleModel?.title
            let iconURL = NSURL(string: cycleModel?.pic_url ?? "")
            iconImageView.kf.setImage(with: ImageResource(downloadURL: iconURL! as URL))
        }
    }

}
