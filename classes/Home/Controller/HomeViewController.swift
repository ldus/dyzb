//
//  HomeViewController.swift
//  DYZB
//
//  Created by 雷志明 on 2018/11/30.
//  Copyright © 2018年 雷志明. All rights reserved.
//

import UIKit

private let kTitleH : CGFloat = 50

class HomeViewController: UIViewController {
   
    private lazy var pageTitleView : PageTitleView = {[weak self] in
        let titleFrame = CGRect(x: 0, y: kstatH + knaviH, width: kscrW, height: kTitleH)
        let titles = ["推荐","游戏","娱乐","趣玩"]
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
        titleView.delegate = self
        return titleView
    }()
    
    private lazy var pageContentView : PageContentView = {[weak self] in
        let kcontH : CGFloat = kscrh - kstatH - knaviH - kTitleH - kTabbarH
        let contentFrame = CGRect(x: 0, y: kstatH + knaviH + kTitleH, width: kscrW, height: kcontH)
        var childVcs = [UIViewController]()
        childVcs.append(RecommendViewController())
        for _ in 0..<3 {
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor(red: CGFloat(arc4random_uniform(255)), green: CGFloat(arc4random_uniform(255)), blue: CGFloat(arc4random_uniform(255)))
            childVcs.append(vc)
        }
        
        let contentView = PageContentView(frame: contentFrame, childVcs: childVcs, parentViewController: self)
        contentView.delegate = self
        return contentView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
}


extension HomeViewController {
    private func setupUI() {
        setupNavigationBar()
        view.addSubview(pageTitleView)
        view.addSubview(pageContentView)
    }
    private func setupNavigationBar() {
        let size = CGSize(width: 40, height: 40)
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo")
        let historyitem = UIBarButtonItem(imageName: "image_my_history", highImageName: "Image_my_history_click", size: size)
        let serchitem = UIBarButtonItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: size)
        let qrcodeitem = UIBarButtonItem(imageName: "Image_scan", highImageName: "Image_scan_click", size: size)
        navigationItem.rightBarButtonItems = [historyitem,serchitem,qrcodeitem]
    }
}


extension HomeViewController : PageTitleViewDelgate{
    func pageTitleView(titleView: PageTitleView, selectedIndex index: Int) {
        pageContentView.setCurrentIndex(currentIndex: index)
    }
}

extension HomeViewController : PageContentViewDelegate{
    func pageContentView(ContentView: PageContentView, progress : CGFloat, sourceIndex: Int, targetIndex: Int) {
        pageTitleView.setTitleWithProgress(progress: progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
}
