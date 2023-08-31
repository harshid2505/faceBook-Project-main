import UIKit

class friendsTableViewCell: UITableViewCell {

    @IBOutlet weak var frdImg: UIImageView!
    @IBOutlet weak var frdName: UILabel!
    @IBOutlet weak var mutualFrd: UILabel!
    @IBOutlet weak var addfriendButton: UIButton!
    @IBOutlet weak var removeButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        setButton()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setButton(){
        addfriendButton.layer.cornerRadius = 5
        removeButton.layer.cornerRadius = 5
    }

}
