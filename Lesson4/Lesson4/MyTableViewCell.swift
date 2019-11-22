//
//  MyTableViewCell.swift
//  Lesson4
//
//  Created by 呂麗莎 on 2019/11/17.
//  Copyright © 2019 呂麗莎. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var newsImg: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsContent: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
