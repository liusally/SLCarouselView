//
//  SLCarouselView.swift
//  SLCarouselView
//
//  Created by Shali Liu on 7/18/17.
//  Copyright © 2017 Shali Liu. All rights reserved.
//

import Foundation
import PureLayout


public class SLCarouselView: UIView, UIScrollViewDelegate {
    
    // Main scroll view
    fileprivate var scrollView: UIScrollView = UIScrollView()
    
    // Scrollable content view
    fileprivate var contentView: UIView = UIView()
    // Set up content width constraint for scrolling
    fileprivate var contentWidthConstraint: NSLayoutConstraint?
    
    // Page control
    fileprivate var pageControl: UIPageControl = UIPageControl()
    fileprivate let PAGECONTROL_DOT_WIDTH = CGFloat(20)
    fileprivate let PAGECONTROL_WIDTH = CGFloat(200)
    fileprivate let PAGECONTROL_HEIGHT = CGFloat(20)
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.addSubview(self.scrollView)
        self.addSubview(self.pageControl)
        
        self.setDefaults()
    }
    
    fileprivate func setDefaults() {
        // Layout scroll view
        self.scrollView.delegate = self
        self.scrollView.autoPinEdgesToSuperviewEdges()
        self.scrollView.addSubview(self.contentView)
        self.scrollView.isPagingEnabled = true
        self.scrollView.showsVerticalScrollIndicator = false
        self.scrollView.showsHorizontalScrollIndicator = false
        
        // Layout content view
        self.contentView.autoPinEdgesToSuperviewEdges()
        self.contentView.autoMatch(ALDimension.height, to: ALDimension.height, of: self.scrollView)

        // Layout page control to the central bottom area
        let width = PAGECONTROL_WIDTH
        
        self.pageControl.frame = CGRect(x: (self.scrollView.frame.size.width - width) / 2, y: self.scrollView.frame.size.height - PAGECONTROL_HEIGHT, width: width, height: PAGECONTROL_HEIGHT)
        self.pageControl.autoSetDimensions(to: CGSize(width: PAGECONTROL_WIDTH, height: PAGECONTROL_HEIGHT))
        self.pageControl.autoPinEdge(toSuperviewEdge: ALEdge.bottom)
        self.pageControl.autoAlignAxis(toSuperviewMarginAxis: ALAxis.vertical)
        
    }
    
    func appendContent(view: UIView) {
        
        let preView = self.contentView.subviews.last
        
        self.contentView.addSubview(view)
        let pageIndex = self.contentView.subviews.count
        
        // Set width, height, top and bottom constraints
        view.autoMatch(ALDimension.width, to: ALDimension.width, of: self.scrollView)
        view.autoMatch(ALDimension.height, to: ALDimension.height, of: self.scrollView)
        view.autoPinEdge(toSuperviewEdge: ALEdge.top)
        view.autoPinEdge(toSuperviewEdge: ALEdge.bottom)
        
        // Left constraints to previous view
        if (preView != nil) {
            view.autoPinEdge(ALEdge.left, to: ALEdge.right, of: preView!)
        } else {
            view.autoPinEdge(toSuperviewEdge: ALEdge.left)
        }
        
        view.layoutIfNeeded()
        
        // Content view width for scrolling
        if (self.contentWidthConstraint != nil) {
            let constraint = self.contentWidthConstraint
            NSLayoutConstraint.deactivate([constraint!])
            
        }
        self.contentWidthConstraint = self.contentView.autoMatch(ALDimension.width, to: ALDimension.width, of: view, withMultiplier: CGFloat(pageIndex))
        
        // Page control paging
        self.pageControl.numberOfPages = pageIndex
        
        self.contentView.layoutIfNeeded()
        self.scrollView.layoutIfNeeded()
        
    }
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let pageWidth = self.scrollView.frame.size.width;
        let page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
        self.pageControl.currentPage = Int(page)
    }
    
}
