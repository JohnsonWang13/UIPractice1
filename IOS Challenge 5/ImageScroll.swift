//
//  ImageScroll.swift
//  IOS Challenge 5
//
//  Created by 王富生 on 2017/3/9.
//  Copyright © 2017年 王富生. All rights reserved.
//

import UIKit

class ImageScroll: UIView, UIScrollViewDelegate {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 22.0
    }
    
    
    
    let imageArray = [UIImage(named: "image1")!, UIImage(named: "image2")!, UIImage(named: "image3")!]
    let imageLabel = ["Mountain 1", "Mountain 2", "Mountain 3"]
    
    fileprivate lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView.init(frame: CGRect(x: 0,
                                                         y: self.bounds.minY,
                                                         width: self.bounds.width,
                                                         height: self.bounds.height - 20))
        scrollView.contentSize = CGSize(width: self.bounds.width * 3, height: scrollView.contentSize.height)
        scrollView.contentOffset = CGPoint(x: self.bounds.maxX, y: 0)
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        return scrollView
    }()
    
    fileprivate lazy var currentImage: UIImageView = {
        let currentImage = UIImageView.init(frame: CGRect(x: self.bounds.maxX + 10,
                                                          y: 0,
                                                          width: self.bounds.width - 20,
                                                          height: self.bounds.height - 20))
        currentImage.layer.cornerRadius = 22.0
        currentImage.layer.masksToBounds = true
        currentImage.image = self.imageArray[0]
        currentImage.backgroundColor = UIColor.gray
        return currentImage
    }()
    
    fileprivate lazy var otherImage: UIImageView = {
        let otherImage = UIImageView.init()
        otherImage.layer.cornerRadius = 22.0
        otherImage.layer.masksToBounds = true
        return otherImage
    }()
    
    fileprivate lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl.init(frame: CGRect(x: self.bounds.width / 2 - 50,
                                                           y: self.bounds.maxY - 17,
                                                           width: 100,
                                                           height: 20))
        pageControl.numberOfPages = self.imageArray.count
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.blue
        
        return pageControl
    }()
    
    fileprivate lazy var pictureLabel: UILabel = {
        let pictureLabel = UILabel.init(frame: CGRect(x: 20,
                                                      y: self.bounds.maxY + self.pageControl.bounds.height - 17,
                                                      width: 100,
                                                      height: 30))
        pictureLabel.text = self.imageLabel[0]
        pictureLabel.font = pictureLabel.font.withSize(18)
        return pictureLabel
    }()
    
    enum Direction {
        case none
        case right
        case left
    }
    
    fileprivate lazy var currentIndex = 0
    fileprivate lazy var nextIndex = 0
    
    fileprivate var direction: Direction? {
        didSet {
            if direction == .right {
                otherImage.frame = CGRect(x: currentImage.frame.maxX + 20,
                                          y: 0,
                                          width: self.bounds.width - 20,
                                          height: self.bounds.height - 20)
                self.nextIndex = self.currentIndex + 1
                if self.nextIndex > self.imageArray.count - 1 {
                    self.nextIndex = 0
                }
                
            } else if direction == .left {
                self.otherImage.frame = CGRect(x: 0,
                                               y: 0,
                                               width: self.bounds.width - 20,
                                               height: self.bounds.height - 20)
                
                self.nextIndex = self.currentIndex - 1
                
                if self.nextIndex < 0 {
                    self.nextIndex = self.imageArray.count - 1
                }
            }
            
            self.otherImage.image = self.imageArray[self.nextIndex]
        }
    }
    
    override func layoutSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(currentImage)
        scrollView.addSubview(otherImage)
        addSubview(pageControl)
        addSubview(pictureLabel)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        direction = scrollView.contentOffset.x > UIScreen.main.bounds.width ? .right : .left
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollDidStop()
    }
    
    private func scrollDidStop() {
        self.direction = .none
        let index = scrollView.contentOffset.x / scrollView.bounds.size.width
        if index == 1 {
            return
        }
        currentImage.image = otherImage.image
        currentIndex = nextIndex
        scrollView.contentOffset = CGPoint(x: self.bounds.width, y: scrollView.contentOffset.y)
        pageControl.currentPage = currentIndex
        pictureLabel.text = imageLabel[currentIndex]
    }
}
