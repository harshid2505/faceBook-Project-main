import UIKit

class morepopUp: UIViewController {
    
    @IBOutlet weak var popUp: UIView!
    
    @IBOutlet weak var popupTb: UITableView!
    var popupName = ["Hide listing","Report listing"]
    var desciption1 = [
        "you'll see less listings like this in the future.","Report a listing to Facebook for review."]
    var popImage = [UIImage(named: "close"),UIImage(named: "warning-sign")]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.alpha = 0
        popUp.layer.cornerRadius = 15
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear){
            self.view.alpha = 1
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: false)
    }
}

extension morepopUp : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return popupName.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = popupTb.dequeueReusableCell(withIdentifier: "popupCell") as! PopUpTableViewCell
        cell.popupLb1.text = "\(popupName[indexPath.row])"
        cell.popupLb2.text = "\(desciption1[indexPath.row])"
        cell.popUpImg.image = popImage[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
