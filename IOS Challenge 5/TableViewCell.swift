//
//  TableViewCell.swift
//  IOS Challenge 5
//
//  Created by 王富生 on 2017/3/10.
//  Copyright © 2017年 王富生. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var times: UILabel!
    @IBOutlet weak var success: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}
