//
//  ContactListCell.swift
//  HyApp
//
//  Created by 黃恩祐 on 2019/2/11.
//  Copyright © 2019年 ENYUHUANG. All rights reserved.
//

import UIKit

class ContactListCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addrLabel: UILabel!
    @IBOutlet weak var tel_1_Label: UILabel!
    @IBOutlet weak var tel_2_Label: UILabel!
    @IBOutlet weak var otherLabel: UILabel!
    @IBOutlet weak var abbrLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
