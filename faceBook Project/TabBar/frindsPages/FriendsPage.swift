import UIKit

class FriendsPage: UIViewController {
    
    @IBOutlet weak var yourFriendsButton: UIButton!
    @IBOutlet weak var friendsTableView: UITableView!
    @IBOutlet weak var searchButton: UIButton!
    var name = ["jenis Navadiya","harshid Vaddoriya","yagnik Kalathiya","Monil Sojitra","vicky Katariya","Niraj Nakarani","Harsh Rathod","Ruhsit Navadiya","Akhil Navadiya","Rushit Maniya","Deep Mangukiya"]
    var mutualFreinds = ["2 mutual friends","1 mutual friends","5 mutual friends","7 mutual friends","12 mutual friends","10 mutual friends","4 mutual friends","11 mutual friends","5 mutual friends","2 mutual friends","6 mutual friends"]
    var frdDp = [UIImage(named: "jenis"),UIImage(named: "harshid"),UIImage(named: "yagnik"),UIImage(named: "monil"),UIImage(named: "vivek"),UIImage(named: "niraj"),UIImage(named: "harsh"),UIImage(named: "rushit n"),UIImage(named: "akhil"),UIImage(named: "rushit m"),UIImage(named: "deep")]
    override func viewDidLoad() {
        super.viewDidLoad()
        setbutton()
    }
    func setbutton(){
        yourFriendsButton.layer.cornerRadius = 18
    }
    @IBAction func searchbuttonAction(_ sender: Any) {
        let navigatiion = storyboard?.instantiateViewController(identifier: "findFriendsPage") as! findFriendsPage
        navigationController?.pushViewController(navigatiion, animated: true)
    }
    
    @IBAction func yourfriendsButtonAction(_ sender: Any) {
        let navigation = storyboard?.instantiateViewController(identifier: "yourfriendsPage") as! yourfriendsPage
        navigationController?.pushViewController(navigation, animated: true)
    }
}

//TABLE VIEW

extension FriendsPage: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = friendsTableView.dequeueReusableCell(withIdentifier: "friendsCell") as! friendsTableViewCell
        cell.frdName.text = "\(name[indexPath.row])"
        cell.mutualFrd.text = "\(mutualFreinds[indexPath.row])"
        cell.frdImg.image = frdDp[indexPath.row]
        cell.frdImg.layer.cornerRadius = cell.frdImg.frame.width/2
        cell.frdImg.layer.backgroundColor = UIColor.black.cgColor
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
