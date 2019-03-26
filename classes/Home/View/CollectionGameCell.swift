//
//  CollectionGameCell.swift
//  DYZB
//
//  Created by 雷志明 on 2018/12/19.
//  Copyright © 2018年 雷志明. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionGameCell: UICollectionViewCell {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var group : AnchorGroup? {
        didSet{
            titleLabel.text = group?.tag_name
            let iconURL = NSURL(string: group?.icon_url ?? "")!
            iconImageView.kf.setImage(with: ImageResource(downloadURL: iconURL as URL) ,placeholder: UIImage(named: "home_more_btn"))
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
