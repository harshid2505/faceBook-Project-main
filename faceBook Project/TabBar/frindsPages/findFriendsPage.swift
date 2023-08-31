import UIKit

class findFriendsPage: UIViewController,UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func backbuttonAction(_ sender: Any) {
        let navigation = storyboard?.instantiateViewController(identifier: "yourfriendsPage") as! yourfriendsPage
        navigationController?.popViewController(animated: true)
    }
}
