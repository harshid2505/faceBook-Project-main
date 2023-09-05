import UIKit

class selectedproductPage: UIViewController {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lb: UILabel!
    
    var a = String()
    var b = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        img.image = b
        lb.text = a
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        let navigatiion = storyboard?.instantiateViewController(identifier: "ShopPage") as! ShopPage
        navigationController?.popViewController(animated: true)
    }
    @IBAction func searchButtonAction(_ sender: Any) {
        let navigatiion = storyboard?.instantiateViewController(identifier: "productSearch") as! productSearch
        navigationController?.pushViewController(navigatiion, animated: true)
    }
    @IBAction func moreButtonAction(_ sender: Any) {
        let navigatiion = storyboard?.instantiateViewController(identifier: "morepopUp") as! morepopUp
        navigationController?.present(navigatiion, animated: true)
    }
    
}

