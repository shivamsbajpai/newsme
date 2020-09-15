//
//  newsCell.swift
//  newsapp
//
//  Created by Shivam on 15/09/20.
//  Copyright © 2020 Shivam. All rights reserved.
//

import UIKit

class newsCell: UITableViewCell {

    
    @IBOutlet weak var newsBubble: UIView!
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var newsImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
