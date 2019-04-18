//
//  OneFieldCell.swift
//  HyApp
//
//  Created by 黃恩祐 on 2019/4/18.
//  Copyright © 2019年 ENYUHUANG. All rights reserved.
//

import UIKit

class OneFieldCell: UITableViewCell {
    
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbContent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
