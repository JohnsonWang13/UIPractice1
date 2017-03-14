//
//  PopoutVC.swift
//  IOS Challenge 5
//
//  Created by 王富生 on 2017/3/10.
//  Copyright © 2017年 王富生. All rights reserved.
//

import UIKit

class PopoutVC: UIViewController {
    
    @IBOutlet weak var popoutTitle: LabelStyle!
    @IBOutlet weak var tableView: UITableView!
    
    var tableViewCell = Array<Int>()
    var challengerData = ChallengerData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        tableViewCell = challengerData.situation!
        popoutTitle.text = "\(challengerData.name!) 挑戰情況"
    }
    
    @IBAction func enter(_ sender: EnterButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
}

extension PopoutVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewCell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as! TableViewCell
        
        cell.selectionStyle = .none
        cell.times.text = "挑戰第\(indexPath.row + 1)次"
        if tableViewCell[indexPath.row] == 0 {
            cell.success.text = "失敗"
            cell.success.textColor = UIColor.red
        } else {
            cell.success.text = "成功"
            cell.success.textColor = UIColor.green
        }
        
        return cell
    }
}
