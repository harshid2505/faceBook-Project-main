//
//  searchTableViewCell.swift
//  faceBook Project
//
//  Created by HARSHID PATEL on 16/08/23.
//

import UIKit

class searchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dpImage: UIImageView!
    @IBOutlet weak var nameLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
