//
//  postTableViewCell.swift
//  faceBook Project
//
//  Created by HARSHID PATEL on 10/08/23.
//

import UIKit

class postTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
