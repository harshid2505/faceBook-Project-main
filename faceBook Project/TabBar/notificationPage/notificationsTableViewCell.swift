import UIKit

class notificationsTableViewCell: UITableViewCell {

    @IBOutlet weak var notificationLb1: UILabel!
    @IBOutlet weak var notificationLb2: UILabel!
    @IBOutlet weak var notificationlmg1: UIImageView!
    @IBOutlet weak var notificationImg2: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
