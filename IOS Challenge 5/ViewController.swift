//
//  ViewController.swift
//  IOS Challenge 5
//
//  Created by 王富生 on 2017/3/8.
//  Copyright © 2017年 王富生. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let challengeData = ChallengeData().challengerData
    var currentChallenger = ChallengerData() {
        didSet {
            challengerName.text = currentChallenger.name
            challengerNumber.text = String(currentChallenger.number!)
            challengerTimes.text = String(currentChallenger.challengeTimes!)
            challengerPhoto.image = currentChallenger.photo
        }
    }
    var currentIndex = 0 {
        didSet {
            currentChallenger = challengeData[currentIndex]
        }
    }

    @IBOutlet weak var scrollImage: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var challengeTimeEdit: UILabel!
    
    
    @IBOutlet weak var challengerNumber: LabelStyle!
    @IBOutlet weak var challengerName: LabelStyle!
    @IBOutlet weak var challengerTimes: LabelStyle!
    @IBOutlet weak var challengerPhoto: UIImageView!
    
    @IBOutlet weak var lastStageBtn: UIButton!
    @IBOutlet weak var nextStageBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentChallenger = challengeData[0]
    }
   
    @IBAction func addToCollect(_ sender: EnterButton) {
        print("加入收藏")
    }
    
    @IBAction func add(_ sender: UIButton) {

        challengeTimeEdit.text = String(Int(challengeTimeEdit.text!)! + 1)
    }
    
    @IBAction func minus(_ sender: UIButton) {
        var label = Int(challengeTimeEdit.text!)
        if label! > 1 {
            label = label! - 1
        } else {
            label = 0
        }
        challengeTimeEdit.text = String(label!)
    }
    
    
    @IBAction func challengeNow(_ sender: EnterButton) {
        print("挑戰次數\(challengeTimeEdit.text!)次")
    }
    
    @IBAction func lastStage(_ sender: UIButton) {
        
        if currentIndex <= 1 {
            currentIndex = 0
            sender.isEnabled = false
            sender.tintColor = UIColor.btnBlue
        } else {
            currentIndex -= 1
        }
        
        nextStageBtn.isEnabled = true
        nextStageBtn.tintColor = UIColor.white
    }
    
    
    @IBAction func nextStage(_ sender: UIButton) {
        
        if currentIndex >= challengeData.count - 2 {
            currentIndex = challengeData.count - 1
            sender.isEnabled = false
            sender.tintColor = UIColor.btnBlue
        } else {
            currentIndex += 1
        }
        
        lastStageBtn.isEnabled = true
        lastStageBtn.tintColor = UIColor.white
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? PopoutVC
        destination?.challengerData = currentChallenger
    }
    
    
    
}
