//
//  CustomTableViewCell.swift
//  feedAppDemo
//
//  Created by Mac on 22/09/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var bigImage: UIImageView!
    @IBOutlet weak var titlename: UILabel!
    @IBOutlet weak var subTitlename: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
