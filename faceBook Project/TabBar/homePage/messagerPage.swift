import UIKit

class messagerPage: UIViewController {
    
    @IBOutlet weak var messengerButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messengerButton.layer.cornerRadius = 5
        chatButton.layer.cornerRadius = 5
    }
    
    @IBAction func closeButtonAction(_ sender: UIButton) {
        let navigate = storyboard?.instantiateViewController(identifier: "HomePage") as! HomePage
        navigationController?.popViewController(animated: true)
    }
}
