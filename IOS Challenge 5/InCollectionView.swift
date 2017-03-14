//
//  InCollectionView.swift
//  IOS Challenge 5
//
//  Created by 王富生 on 2017/3/13.
//  Copyright © 2017年 王富生. All rights reserved.
//

import UIKit

class InCollectionView: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
}

extension InCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath)
            return cell
        } else if indexPath.row == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell3", for: indexPath)
            return cell
        }
    }
}

extension InCollectionView: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: self.view.bounds.width, height: 300)
        } else if indexPath.row == 1 {
            return CGSize(width: self.view.bounds.width, height: 250)
        } else {
            return CGSize(width: self.view.bounds.width, height: 300)
        }
        
    }
}
