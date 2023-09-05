import UIKit

class ShopPage: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var productshopCollectionViewCell: UICollectionView!
    
    var photo = [UIImage(named: "airpods"),UIImage(named: "cb unicorn"),UIImage(named: "track combo 2"),UIImage(named: "gadi"),UIImage(named: "shoes"),UIImage(named: "bicycle"),UIImage(named: "car"),UIImage(named: "facewash"),UIImage(named: "mouse"),UIImage(named: "poco F5"),UIImage(named: "shoes 2"),UIImage(named: "t shirt"),UIImage(named: "airdopes"),UIImage(named: "neckband 1"),UIImage(named: "conveter"),UIImage(named: "datacable"),UIImage(named: "laptop"),UIImage(named: "pendrive"),UIImage(named: "pent"),UIImage(named: "chair")]
    var name = ["₹199 ⋅ Airpods","₹15,000 ⋅ Cb unicorn","₹599 ⋅ track Combo","₹1999 ⋅ Monstor truck","₹1500 ⋅ Shoes","₹5999 ⋅ bicycle","₹1,59,999 ⋅ car","₹99 ⋅ Facewash","₹599 ⋅ mouse","₹15,999 ⋅ Poco F5 5g","₹999 ⋅ Shoes","₹299 ⋅ T Shirt","₹1299 ⋅ Airdopes","₹399 ⋅ NeckBand","₹199 ⋅ Convter","₹99 ⋅ Data Cable","₹33,999 ⋅ laptop","₹599 ⋅ Pendrive","₹799 ⋅ Pent","₹1399 ⋅ Chair"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = productshopCollectionViewCell.dequeueReusableCell(withReuseIdentifier: "shopCell", for: indexPath) as! shopCollectionViewCell
        cell.productImg.image = photo[indexPath.row]
        cell.productName.text = "\(name[indexPath.row])"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 178, height: 225)
    }
    
    @IBAction func searchButtonAction(_ sender: Any) {
        let navigatiion = storyboard?.instantiateViewController(identifier: "productSearch") as! productSearch
        navigationController?.pushViewController(navigatiion, animated: true)
    }
    
    func navigation(name:String,photo:UIImage){
        //        let navigate = storyboard?.instantiateViewController(withIdentifier: "selectedproductPage") as! selectedproductPage
        //        navigate.a = name
        //        navigate.b = photo
        //        navigationController?.pushViewController(navigate, animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "selectedproductPage") as! selectedproductPage
        navigate.a = name[indexPath.row]
        navigate.b = photo[indexPath.row]!
        navigationController?.pushViewController(navigate, animated: true)
    }
}





