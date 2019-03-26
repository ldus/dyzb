//
//  PageTitleView.swift
//  DYZB
//
//  Created by 雷志明 on 2018/12/3.
//  Copyright © 2018年 雷志明. All rights reserved.
//

import UIKit

protocol PageTitleViewDelgate : class {
    func pageTitleView(titleView : PageTitleView , selectedIndex index : Int)
}

private let scrollLineH : CGFloat = 3
private let kNormalColor : (CGFloat,CGFloat,CGFloat) = (85,85,85)
private let kSelectColor : (CGFloat,CGFloat,CGFloat) = (255,128,0)

class PageTitleView: UIView {
    private var titles : [String]
    private var currentIndex = 0
    weak var delegate : PageTitleViewDelgate?
    
    private lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        scrollView.contentInsetAdjustmentBehavior = .always
        return scrollView
    }()
    
    private lazy var scrollLine :UIView = {
        let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor.orange
        return scrollLine
    }()
    
    private lazy var titleLabels : [UILabel] = [UILabel]()

    init(frame: CGRect, titles : [String]) {
        self.titles = titles
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PageTitleView {
    private func setupUI() {
        addSubview(scrollView)
        scrollView.frame = bounds
        
        setupTitleLabel()
        setupBottomLineAndScollLine()
    }
    private func setupTitleLabel() {
        
        let labelW : CGFloat = frame.width / CGFloat(titles.count)
        let labelH : CGFloat = frame.height - scrollLineH
        let labelY : CGFloat = 0
        
        for (index , title) in titles.enumerated(){
            let label = UILabel()
            label.text = title
            label.tag = index
            label.font = UIFont.systemFont(ofSize: 16)
            label.textColor = UIColor(red: kNormalColor.0, green: kNormalColor.1, blue: kNormalColor.2)
            label.textAlignment = .center
            let labelX = labelW * CGFloat(index)
            
            label.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
            
            scrollView.addSubview(label)
            titleLabels.append(label)
            
            label.isUserInteractionEnabled = true
            let tapGes = UITapGestureRecognizer(target: self, action: #selector(self.titleLabelClick(tapGes:)))
            label.addGestureRecognizer(tapGes)
        }
        
    }
    
    private func setupBottomLineAndScollLine(){
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGray
        let lineH : CGFloat = 0.3
        bottomLine.frame = CGRect(x: 0, y: frame.height - lineH, width: kscrW, height: lineH)
        addSubview(bottomLine)
        
        scrollView.addSubview(scrollLine)
        
        guard let firstLabel = titleLabels.first else {
            return
        }
        firstLabel.textColor = UIColor(red: kSelectColor.0, green: kSelectColor.1, blue: kSelectColor.2)
        scrollLine.frame = CGRect(x: firstLabel.frame.origin.x, y: frame.height - scrollLineH, width: firstLabel.frame.width, height: scrollLineH)
        
        
    }
}

extension PageTitleView{
    @objc private func titleLabelClick(tapGes : UITapGestureRecognizer){
        guard let currentLabel = tapGes.view as? UILabel else {return}
        let outLabel = titleLabels[currentIndex]
        outLabel.textColor = UIColor(red: kNormalColor.0, green: kNormalColor.1, blue: kNormalColor.2)
        currentLabel.textColor = UIColor(red: kSelectColor.0, green: kSelectColor.1, blue: kSelectColor.2)
        currentIndex = currentLabel.tag
        
        let scrollLineX = CGFloat(currentLabel.tag) * scrollLine.frame.width
        UIView.animate(withDuration: 0.3){
            self.scrollLine.frame.origin.x = scrollLineX
        }
        
        delegate?.pageTitleView(titleView: self, selectedIndex: currentIndex)
        
    }
}


extension PageTitleView {
    func setTitleWithProgress(progress : CGFloat , sourceIndex : Int, targetIndex : Int){
        let sourceLabel = titleLabels[sourceIndex]
        let targetLabel = titleLabels[targetIndex]
        
        let moveTotalX = targetLabel.frame.origin.x - sourceLabel.frame.origin.x
        let moveX = moveTotalX * progress
        scrollLine.frame.origin.x = sourceLabel.frame.origin.x + moveX
        
        let colorDelta = (kSelectColor.0 - kNormalColor.0 , kSelectColor.1 - kNormalColor.1 , kSelectColor.2 - kNormalColor.2)
        sourceLabel.textColor = UIColor(red: kSelectColor.0 - colorDelta.0 * progress, green: kSelectColor.1 - colorDelta.1 * progress, blue: kSelectColor.2 - colorDelta.2 * progress)
        targetLabel.textColor = UIColor(red: kNormalColor.0 + colorDelta.0 * progress, green: kNormalColor.1 + colorDelta.1 * progress, blue: kNormalColor.2 + colorDelta.2 * progress)
        
    }
}
