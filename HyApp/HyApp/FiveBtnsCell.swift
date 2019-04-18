//
//  FiveBtnsCell.swift
//  HyApp
//
//  Created by 黃恩祐 on 2019/4/19.
//  Copyright © 2019年 ENYUHUANG. All rights reserved.
//

import UIKit

class FiveBtnsCell: UITableViewCell {
    
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var radio_1: SSRadioButton!
    @IBOutlet weak var radio_2: SSRadioButton!
    @IBOutlet weak var radio_3: SSRadioButton!
    @IBOutlet weak var radio_4: SSRadioButton!
    @IBOutlet weak var radio_5: SSRadioButton!
    @IBOutlet weak var radio_6: SSRadioButton!
    @IBOutlet weak var lbTitle_2: UILabel!
    @IBOutlet weak var lbContent_2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
