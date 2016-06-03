//
//  LeftTableViewCell.swift
//  SlideMenuControllerSwift
//
//  Created by Ratnakala58 on 4/7/16.
//  Copyright © 2016 Yuji Hato. All rights reserved.
//

import UIKit

class LeftTableViewCell: UITableViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var label_text: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
