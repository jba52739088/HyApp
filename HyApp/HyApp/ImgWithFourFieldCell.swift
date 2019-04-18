//
//  ImgWithFourFieldCell.swift
//  HyApp
//
//  Created by 黃恩祐 on 2019/4/18.
//  Copyright © 2019年 ENYUHUANG. All rights reserved.
//

import UIKit

protocol ModifyFavoriteTypeDelegate {
    func onModifyFavoriteType()
}

class ImgWithFourFieldCell: UITableViewCell {
    
    @IBOutlet weak var btnLike: UIButton!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lbTitle_1: UILabel!
    @IBOutlet weak var lbTitle_2: UILabel!
    @IBOutlet weak var lbTitle_3: UILabel!
    @IBOutlet weak var lbTitle_4: UILabel!
    @IBOutlet weak var lbContent_1: UILabel!
    @IBOutlet weak var lbContent_2: UILabel!
    @IBOutlet weak var lbContent_3: UILabel!
    @IBOutlet weak var lbContent_4: UILabel!
    
    var delegate: ModifyFavoriteTypeDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func onTapButton(_ sender: Any) {
        self.delegate.onModifyFavoriteType()
    }
    
}
