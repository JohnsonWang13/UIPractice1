//
//  ScrollImage.swift
//  IOS Challenge 5
//
//  Created by 王富生 on 2017/3/8.
//  Copyright © 2017年 王富生. All rights reserved.
//

import UIKit

class ScrollImage: UIView {
    
    let imageArray = [UIImage(named: "image1")!, UIImage(named: "image2")!, UIImage(named: "image3")!]
    
    fileprivate var currentIndex = 0
    fileprivate var nextIndex = 0
    fileprivate var timer: Timer?
    
    enum Direction {
        case none
        case right
        case left
    }
    
    fileprivate var direction: Direction? {
        didSet {
            if direction == .right {
                otherImage.frame = CGRect(x: 0,
                                          y: 0,
                                          width: self.bounds.width,
                                          height: self.bounds.height)
                self.nextIndex = self.currentIndex - 1
                
                if self.nextIndex < 0 {
                    self.nextIndex = self.imageArray.count - 1
                }
                
            } else if direction == .left {
                self.otherImage.frame = CGRect(x: currentImageView.frame.maxX,
                                               y: 0,
                                               width: self.bounds.width,
                                               height: self.bounds.width)
                self.nextIndex = self.currentIndex + 1
                if self.nextIndex > self.imageArray.count - 1 {
                    self.nextIndex = 0
                }
            }
            
            self.otherImage.image = self.imageArray[self.nextIndex]
            self.otherImage.contentMode = .scaleAspectFill
            pageControl.currentPage = currentIndex
            
        }
    }
    
    fileprivate lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView.init(frame: CGRect(x: 0,
                                                         y: 0,
                                                         width: self.bounds.width,
                                                         height: self.bounds.height))
        scrollView.contentSize = CGSize(width: self.bounds.width * 3, height: 0)
        scrollView.contentOffset = CGPoint(x: self.bounds.width, y: 0)
        scrollView.contentInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        
        return scrollView
    }()
    
    fileprivate lazy var currentImageView: UIImageView = {
        let currentImageView = UIImageView.init(frame: CGRect(x: self.bounds.width,
                                                              y: 0,
                                                              width: self.bounds.width,
                                                              height: self.bounds.height))
        print("currentBounds = ", currentImageView.bounds)
        
        currentImageView.image = self.imageArray[0]
        currentImageView.layer.cornerRadius = 22.0
        currentImageView.contentMode = .scaleAspectFill
        
        return currentImageView
    }()
    
    fileprivate lazy var otherImage = UIImageView()
    
    fileprivate lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl.init(frame: CGRect(x: self.bounds.width / 2 - 30, y: self.bounds.maxY, width: 60, height: 15))
        pageControl.numberOfPages = self.imageArray.count
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.blue
        
        return pageControl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func layoutSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(currentImageView)
        scrollView.addSubview(otherImage)
        addSubview(pageControl)
        print(self.bounds)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 22.0
        //        startTimer()
    }
    
    func startTimer() {
        if imageArray.count == 1 {
            return
        }
        if timer != nil {
            timer!.invalidate()
            timer = nil
        }
        timer = Timer.init(timeInterval: 2, target: self, selector: #selector(self.nextPage), userInfo: nil, repeats: true)
        RunLoop.current.add(timer!, forMode: RunLoopMode.commonModes)
    }
    
    func nextPage () {
        scrollView.setContentOffset(CGPoint(x: scrollView.bounds.size.width * 2, y: 0), animated: true)
        //调用完setContentOffset方法系统自动调用 scrollViewDidEndScrollingAnimation方法
    }
    
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        scrollDidStop() //滑动结束后作处理
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        timer?.invalidate() //用户拖动时停止定时器
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        startTimer()//松开后再次启动定时器
    }
}

extension ScrollImage: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        direction = scrollView.contentOffset.x > UIScreen.main.bounds.width ? .left : .right
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollDidStop()
    }
    
    fileprivate func scrollDidStop() {
        self.direction = .none
        let index = scrollView.contentOffset.x/scrollView.bounds.size.width
        if index == 1 {
            return
        }
        
        currentImageView.frame = CGRect(x: scrollView.frame.maxX,
                                        y: 0,
                                        width: scrollView.bounds.size.width,
                                        height: scrollView.bounds.size.height)
        currentIndex = self.nextIndex
        currentImageView.image = self.otherImage.image
        scrollView.contentOffset = CGPoint(x: scrollView.bounds.size.width, y: scrollView.contentOffset.y)
    }
}












































