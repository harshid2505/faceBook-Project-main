import UIKit

class JoinFacebook: UIViewController {
    
    @IBOutlet weak var getStartedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        setGetStartedButton()
    }
    
    func setGetStartedButton(){
        getStartedButton.layer.cornerRadius = 20
    }
    
    func backbuttonNavigation(){
        let navigation = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        navigationController?.popViewController(animated: true)
    }
    
    func getstartedButton(){
        let navigation = storyboard?.instantiateViewController(withIdentifier: "createAccount") as! createAccount
        navigationController?.pushViewController(navigation, animated: true)
    }
    
    func alreadyHaveAnAccount(){
        let navigation = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        backbuttonNavigation()
    }
    @IBAction func getStartedButtonAction(_ sender: Any) {
        getstartedButton()
    }
    @IBAction func AlreadyHaveAnAccountButtonAction(_ sender: Any) {
        alreadyHaveAnAccount()
    }
}
