import UIKit

class MenuPage: UIViewController{
    
    @IBOutlet weak var dp: UIImageView!
    @IBOutlet weak var menuCv: UICollectionView!
    @IBOutlet weak var seeMorebutton: UIButton!
    @IBOutlet weak var logOutButton: UIButton!
    var photo = [UIImage(named: "back-in-time"),UIImage(named: "save-instagram"),UIImage(named: "multiple-users-silhouette"),UIImage(named: "youtube"),UIImage(named: "store (1)"),UIImage(named: "friends (2)"),UIImage(named: "web-content"),UIImage(named: "calendar")]
    var name = ["Memories","Saved","Groups","Video","Marketplace","Friends","Feeds","Events"]
    override func viewDidLoad() {
        super.viewDidLoad()
        dp.layer.cornerRadius = dp.frame.width/2
        seeMorebutton.layer.cornerRadius = 5
        logOutButton.layer.cornerRadius = 5
    }

    @IBAction func logoutbuttonAction(_ sender: UIButton) {
        if let navigationController = self.navigationController {
            for viewController in navigationController.viewControllers {
                if viewController is ViewController {
                    navigationController.popToViewController(viewController, animated: true)
                    break
                }
            }
        }
        //        let navigation =  storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        //        navigationController?.pushViewController(navigation, animated: true)
    }
    
}

extension MenuPage : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = menuCv.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as! menuCollectionViewCell
        cell.menuImage.image = photo[indexPath.row]
        cell.menuName.text = "\(name[indexPath.row])"
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 0.5
        cell.layer.shadowOffset = CGSize(width: 1, height: 1.5)
        cell.layer.shadowRadius = 3
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 175
                      , height: 73)
    }
    
}
