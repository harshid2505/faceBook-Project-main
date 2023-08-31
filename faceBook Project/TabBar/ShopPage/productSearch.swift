import UIKit

class productSearch: UIViewController {

    @IBOutlet weak var pdSearchTxt: UITextField!
    
    @IBOutlet weak var categoriesTableView: UITableView!
    
    var findImage = [UIImage(named: "car (1)"),UIImage(named: "rental"),UIImage(named: "dress"),UIImage(named: "clothes"),UIImage(named: "sofa"),UIImage(named: "cell-phone"),UIImage(named: "french-horn"),UIImage(named: "form"),UIImage(named: "brush"),UIImage(named: "tire"),UIImage(named: "pacifier"),UIImage(named: "book"),UIImage(named: "t-shirt"),UIImage(named: "garage"),UIImage(named: "frame"),UIImage(named: "paintbrush"),UIImage(named: "necklace"),UIImage(named: "shopping-bag"),UIImage(named: "voting-box"),UIImage(named: "shovel"),UIImage(named: "paw"),UIImage(named: "man-running"),UIImage(named: "game-controller")]
    var findName = ["Vehicles","Rentals","Women's Clothing & Shoes","Men's Clothing & Shoes","Furniture","Electronices","AntiQues & Collectibles","Appliances","Arts & Crafts","Auto Parts","Baby","Books,Movies & Accesories","Garage Sale","Health & Beauty","Home Improvement & Tools","housing for Sale","jewelry & Watches","luggage & Bags","Miscellaneous","Patio & Garden","Pet Supplies","Sporting Goods","Toys & Games"]
    override func viewDidLoad() {
        super.viewDidLoad()
        pdSearchTxt.layer.cornerRadius = 12
    }
    @IBAction func backButtonAction(_ sender: Any) {
        let navigatiion = storyboard?.instantiateViewController(identifier: "ShopPage") as! ShopPage
        navigationController?.popViewController(animated: true)
    }
    
}

extension productSearch : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return findName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = categoriesTableView.dequeueReusableCell(withIdentifier: "categoriesCell") as! productbuyTableViewCell
        cell.findProductName.text = "\(findName[indexPath.row])"
        cell.findProductImg.image = findImage[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}
