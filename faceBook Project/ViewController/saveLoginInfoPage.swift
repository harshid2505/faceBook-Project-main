import UIKit

class saveLoginInfoPage: UIViewController {
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var notNowbutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNotNowButton()
    }
    
    func setNotNowButton(){
        notNowbutton.layer.cornerRadius = 22
        notNowbutton.layer.borderWidth = 1
        notNowbutton.layer.borderColor = UIColor.gray.cgColor
        saveButton.layer.cornerRadius = 22
    }
    
    func navigation(){
        let navigate = storyboard?.instantiateViewController(identifier: "TabBarController") as! TabBarController
        navigationController?.pushViewController(navigate, animated: true)
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        let navigate = storyboard?.instantiateViewController(identifier: "TermsAndCondition") as! TermsAndCondition
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveButtonAction(_ sender: Any) {
        navigation()
    }
    
    @IBAction func notNowButtonAction(_ sender: Any) {
        navigation()
    }
    
}
