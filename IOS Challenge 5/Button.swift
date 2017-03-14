//
//  Button.swift
//  IOS Challenge 4
//
//  Created by 王富生 on 2017/3/2.
//  Copyright © 2017年 王富生. All rights reserved.
//

import UIKit

class lightButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = 22.0
        
        self.layer.borderColor = UIColor.btnBlue.cgColor
        self.layer.borderWidth = 1.0
        
        self.backgroundColor = UIColor.veryLightGary
        self.tintColor = UIColor.btnBlue
        
    }
}


class EnterButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = 22.0
        
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 1.0
        
        self.backgroundColor = UIColor.btnBlue
        self.tintColor = UIColor.white
        
    }
}

extension UIButton {
    func set() {
        self.backgroundColor = UIColor.btnBlue
        self.tintColor = UIColor.white
        self.isEnabled = false
    }
    
    func unset() {
        self.backgroundColor = UIColor.white
        self.tintColor = UIColor.gray
        self.isEnabled = true
    }
}
