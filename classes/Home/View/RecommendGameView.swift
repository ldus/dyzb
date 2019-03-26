//
//  RecommendGameView.swift
//  DYZB
//
//  Created by 雷志明 on 2018/12/19.
//  Copyright © 2018年 雷志明. All rights reserved.
//

import UIKit

private let kGameCellID = "kGameCellID"
private let KEdgeInsetMargin : CGFloat = 10

class RecommendGameView: UIView {
    var groups : [AnchorGroup]? {
        didSet{
            groups?.removeFirst()
            groups?.removeFirst()
            let moreGroup = AnchorGroup()
            moreGroup.tag_name = "更多"
            groups?.append(moreGroup)
            collectionView.reloadData()
        }
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        autoresizingMask = []
        collectionView.register(UINib(nibName: "CollectionGameCell", bundle: nil), forCellWithReuseIdentifier: kGameCellID)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: KEdgeInsetMargin, bottom: 0, right: KEdgeInsetMargin)
    }

}

extension RecommendGameView{
    class func recommendGameView() -> RecommendGameView{
        return Bundle.main.loadNibNamed("RecommendGameView", owner: nil, options: nil)?.first as! RecommendGameView
    }
}

extension RecommendGameView : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kGameCellID, for: indexPath) as! CollectionGameCell
        cell.group = groups![indexPath.item]
        
        return cell
    }
    
    
}
