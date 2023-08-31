import UIKit

class saveInfo: UIViewController {
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var notNowButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setNextButton()
        setNotNowButton()
    }
    func setNextButton(){
        saveButton.layer.cornerRadius = 20
    }
    func setNotNowButton(){
        notNowButton.layer.cornerRadius = 20
    }
    func saveButtonnavigation(){
        let navigation = storyboard?.instantiateViewController(withIdentifier: "TermsAndCondition") as! TermsAndCondition
        navigationController?.pushViewController(navigation, animated: true)
    }
    func alreadyHaveAnAccount(){
        let navigation = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        navigationController?.popViewController(animated: true)
    }
    func backButtonNavigation(){
        let navigation = storyboard?.instantiateViewController(withIdentifier: "createAccount") as! createAccount
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        backButtonNavigation()
    }
    @IBAction func saveButtonAction(_ sender: Any) {
        saveButtonnavigation()
    }
    @IBAction func notNowButtonAction(_ sender: Any) {
    }
    @IBAction func alreadyButtonAction(_ sender: Any) {
        alreadyHaveAnAccount()
    }
}
