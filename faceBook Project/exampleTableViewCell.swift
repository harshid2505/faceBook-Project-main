//
//  exampleTableViewCell.swift
//  faceBook Project
//
//  Created by HARSHID PATEL on 05/09/23.
//

import UIKit

class exampleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var postImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
