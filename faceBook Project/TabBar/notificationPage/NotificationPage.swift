import UIKit

class NotificationPage: UIViewController {

    @IBOutlet weak var notificationTb: UITableView!
    
    var notifications = ["Jenis Navadiya was tagged in a post.","Muniram Lace added story. ","Harshid Vaddoriya posted Jenis Navadiya's memory.","you have a new friend suggestion : Monil Sojitra.","yagnik Kalathiya added a post.","Jeet Rakholiya posted in Entertainment club.","Rushit Maniya posted a photo.","Jeel Maniya was tagged in a post.","Niraj Nakarani posted a memory.","yagnik kalathiya posted Jenis Navadiya's memory.","you have a new friend suggestion : Rushit Navadiya."]
    var time = ["Aug 6 at 6:07 PM","Aug 4 at 3:15 PM","Jul 30 at 7:46 AM","Jul 29 at 11:48 PM","Jul 28 at 12:47 PM","Jul 26 at 4:18 PM","Jul 27 at 2:47 PM","Jul 25 at 10:47 PM","Jul 24 at 1:47 PM","Jul 23 at 11:47 AM","Jul 22 at 1:47 PM"]
    var img1 = [UIImage(named: "jenishDP"),UIImage(named: "muniram"),UIImage(named: "harshid"),UIImage(named: "monilDP"),UIImage(named: "yagnik"),UIImage(named: "jeet"),UIImage(named: "rushit m"),UIImage(named: "jeel"),UIImage(named: "niraj"),UIImage(named: "jy"),UIImage(named: "rushit n")]
    var img2 = [UIImage(named: "comment 1"),UIImage(named: "verified"),UIImage(named: "comment 1"),UIImage(named: "verified"),UIImage(named: "comment 1"),UIImage(named: "verified"),UIImage(named: "comment 1"),UIImage(named: "verified"),UIImage(named: "comment 1"),UIImage(named: "verified"),UIImage(named: "comment 1")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    }
}

extension NotificationPage : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifications.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = notificationTb.dequeueReusableCell(withIdentifier: "notificationcell") as! notificationsTableViewCell
        cell.notificationLb1.text = "\(notifications[indexPath.row])"
        cell.notificationLb2.text = "\(time[indexPath.row])"
        cell.notificationlmg1.image = img1[indexPath.row]
        cell.notificationlmg1.layer.cornerRadius = cell.notificationlmg1.frame.width/2
        cell.notificationImg2.image = img2[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
}
