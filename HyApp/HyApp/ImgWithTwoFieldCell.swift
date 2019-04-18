//
//  ImgWithTwoFieldCell.swift
//  HyApp
//
//  Created by 黃恩祐 on 2019/4/18.
//  Copyright © 2019年 ENYUHUANG. All rights reserved.
//

import UIKit

class ImgWithTwoFieldCell: UITableViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lbTitle_1: UILabel!
    @IBOutlet weak var lbTitle_2: UILabel!
    @IBOutlet weak var lbContent_1: UILabel!
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
