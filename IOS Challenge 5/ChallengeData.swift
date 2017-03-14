//
//  File.swift
//  IOS Challenge 5
//
//  Created by 王富生 on 2017/3/10.
//  Copyright © 2017年 王富生. All rights reserved.
//

import UIKit

class ChallengeData {
    
    var challengerData = [ChallengerData]()
    
    var challenger1 = ChallengerData.init(number: 100001, name: "Zelda", challengeTimes: 4, photo: UIImage(named: "person1.jpeg"), situation: [1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 0])
    var challenger2 = ChallengerData.init(number: 100002, name: "FatGuy", challengeTimes: 3, photo: UIImage(named: "person2.jpg"), situation: [0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0])
    var challenger3 = ChallengerData.init(number: 100003, name: "BlueHead", challengeTimes: 5, photo: UIImage(named: "person3.jpg"), situation: [1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0])
    init() {
        challengerData.append(challenger1)
        challengerData.append(challenger2)
        challengerData.append(challenger3)
    }
}

struct ChallengerData {
    var number: Int?
    var name: String?
    var challengeTimes: Int?
    var photo: UIImage?
    var situation: [Int]?
}
