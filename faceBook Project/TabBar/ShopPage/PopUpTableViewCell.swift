import UIKit

class PopUpTableViewCell: UITableViewCell {

    @IBOutlet weak var popUpImg: UIImageView!
    @IBOutlet weak var popupLb1: UILabel!
    @IBOutlet weak var popupLb2: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
