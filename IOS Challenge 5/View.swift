//
//  ChallengeProfile.swift
//  IOS Challenge 5
//
//  Created by 王富生 on 2017/3/9.
//  Copyright © 2017年 王富生. All rights reserved.
//

import UIKit

class ChallengeProfile: UIView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 22.0
        self.backgroundColor = UIColor.veryLightGary
        self.layer.borderColor = UIColor.btnBlue.cgColor
        self.layer.borderWidth = 1.0
    }
}

class StageChooseBackground: UIView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.btnBlue
        self.layer.cornerRadius = 22.0
    }
}

class StageView: UIView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 22.0
        self.layer.borderColor = UIColor.btnBlue.cgColor
        self.layer.borderWidth = 1.0
    }
}
