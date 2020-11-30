//
//  NewsViewCell.swift
//  NewsMe
//
//  Created by Shivam on 30/11/20.
//

import UIKit

class NewsViewCell: UITableViewCell {

    @IBOutlet weak var newsImage: LazyImageView!
    
    @IBOutlet weak var newsHeadline: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
