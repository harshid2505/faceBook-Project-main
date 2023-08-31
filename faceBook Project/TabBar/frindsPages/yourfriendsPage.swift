import UIKit

struct Model1 {
    var name : String
    var photo : UIImage
    var mutualFrd : String
}

class yourfriendsPage: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var yourfriendsTableview: UITableView!
    
    var arr = [Model1(name: "Jenis Navadiya", photo: UIImage(named: "jenishDP")!, mutualFrd: "2 mutual friends"),Model1(name: "Harshid Vaddoriya", photo: UIImage(named: "harshid")!, mutualFrd: "1 mutual friends"),Model1(name: "Yagnik Kalathiya", photo: UIImage(named: "yagnik")!, mutualFrd: "5 mutual friends"),Model1(name: "Monil Sojitra", photo: UIImage(named: "monilDP")!, mutualFrd: "7 mutual friends"),Model1(name: "Vicky Katariya", photo: UIImage(named: "vivekDP")!, mutualFrd: "12 mutual friends"),Model1(name: "Niraj Nakarani", photo: UIImage(named: "niraj")!, mutualFrd: "10 mutual friends"),Model1(name: "Harsh Rathod", photo: UIImage(named: "harsh")!, mutualFrd: "4 mutual friends"),Model1(name: "Rushit Navadiya", photo: UIImage(named: "rushit n")!, mutualFrd: "11 mutual friends"),Model1(name: "Akhil Navadiya", photo: UIImage(named: "akhil")!, mutualFrd: "5 mutual friends"),Model1(name: "Rushit Maniya", photo: UIImage(named: "rushit m")!, mutualFrd: "2 mutual friends"),Model1(name: "Deep Mangukiya", photo: UIImage(named: "deep")!, mutualFrd: "6 mutual friends")]
    
    var arr2 = [Model1(name: "Jenis Navadiya", photo: UIImage(named: "jenishDP")!, mutualFrd: "2 mutual friends"),Model1(name: "Harshid Vaddoriya", photo: UIImage(named: "harshid")!, mutualFrd: "1 mutual friends"),Model1(name: "Yagnik Kalathiya", photo: UIImage(named: "yagnik")!, mutualFrd: "5 mutual friends"),Model1(name: "Monil Sojitra", photo: UIImage(named: "monilDP")!, mutualFrd: "7 mutual friends"),Model1(name: "Vicky Katariya", photo: UIImage(named: "vivekDP")!, mutualFrd: "12 mutual friends"),Model1(name: "Niraj Nakarani", photo: UIImage(named: "niraj")!, mutualFrd: "10 mutual friends"),Model1(name: "Harsh Rathod", photo: UIImage(named: "harsh")!, mutualFrd: "4 mutual friends"),Model1(name: "Rushit Navadiya", photo: UIImage(named: "rushit n")!, mutualFrd: "11 mutual friends"),Model1(name: "Akhil Navadiya", photo: UIImage(named: "akhil")!, mutualFrd: "5 mutual friends"),Model1(name: "Rushit Maniya", photo: UIImage(named: "rushit m")!, mutualFrd: "2 mutual friends"),Model1(name: "Deep Mangukiya", photo: UIImage(named: "deep")!, mutualFrd: "6 mutual friends")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.layer.cornerRadius = 15
        searchBar.delegate = self
          yourfriendsTableview.reloadData()
    }

    @IBAction func backbuttonActiion(_ sender: Any) {
        let navigatiion = storyboard?.instantiateViewController(identifier: "FriendsPage") as! FriendsPage
        navigationController?.popViewController(animated: true)
    }
    @IBAction func searchButtonAction(_ sender: Any) {
        let navigatiion = storyboard?.instantiateViewController(identifier: "findFriendsPage") as! findFriendsPage
        navigationController?.pushViewController(navigatiion, animated: true)
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == ""{
            arr = arr2
        }
        else{
            arr = arr2.filter{ $0.name.contains(searchText)}
            print(arr)
        }
        
        yourfriendsTableview.reloadData()
    }
    func searchBar(_ searchBar: UISearchBar) {
        searchBar.text = ""
        arr2 = arr
        yourfriendsTableview.reloadData()
        searchBar.resignFirstResponder()
    }
}



// TABEL VIEW

extension yourfriendsPage : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = yourfriendsTableview.dequeueReusableCell(withIdentifier: "yourfriendsCell") as! searchfriendsTableViewCell
        cell.searchFrdImg.image = arr[indexPath.row].photo
        cell.nameLabel.text = arr[indexPath.row].name
        cell.mutualfrdLb.text = arr[indexPath.row].mutualFrd
        cell.searchFrdImg.layer.cornerRadius = cell.searchFrdImg.frame.width/2
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 124
    }
}
