//
//  homeTableViewCell2.swift
//  faceBook Project
//
//  Created by HARSHID PATEL on 12/08/23.
//

import UIKit

class homeTableViewCell2: UITableViewCell {
    
    @IBOutlet weak var dpImageView: UIImageView!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var lable: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeCountLable: UILabel!
    @IBOutlet weak var shareCountLable: UILabel!
    @IBOutlet weak var likeLable: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    var a = 1
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func likeButtonAction(_ sender: Any) {
        if a == 0{
            likeButton.setImage(UIImage(named: "like"), for: .normal)
            likeLable.textColor = .systemGray
            a = 1
        }
        else{
            likeButton.setImage(UIImage(named: "likeBlue"), for: .normal)
            likeLable.textColor = .blue
            a = 0
        }
    }
    
    @IBAction func commentButtonAction(_ sender: UIButton) {
    }
    
}
