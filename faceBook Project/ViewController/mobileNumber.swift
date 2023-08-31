import UIKit

class mobileNumber: UIViewController {
    
    @IBOutlet weak var mobilenumbertxt: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var signupWithEmailButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNextButton()
        setSignUpWithEmailButton()
    }
    
    func setNextButton(){
        nextButton.layer.cornerRadius = 20
    }
    
    func setSignUpWithEmailButton(){
        signupWithEmailButton.layer.cornerRadius = 20
    }
    
    func backButtonNavigation(){
        let navigation = storyboard?.instantiateViewController(withIdentifier: "JoinFacebook") as! JoinFacebook
        navigationController?.popViewController(animated: true)
    }
    
    func nextButtonNavigation(){
        let navigation = storyboard?.instantiateViewController(withIdentifier: "signupWithEmail") as! signupWithEmail
        navigationController?.pushViewController(navigation, animated: true)
    }
    
    func signUpWithEmailNavigation(){
        let navigation = storyboard?.instantiateViewController(withIdentifier: "signupWithEmail") as! signupWithEmail
        navigationController?.pushViewController(navigation, animated: true)
    }
    
    func alert(){
        let alert = UIAlertController.init(title: "Enter a mobile number", message: "You'll need to enter a 10 digit number to continue.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive))
        present(alert, animated: true)
    }

    
    @IBAction func backButtonAction(_ sender: Any) {
        backButtonNavigation()
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        if mobilenumbertxt.text!.count <= 9{
            alert()
        }
        else{
            nextButtonNavigation()
        }
    }
    
    @IBAction func signUpWithEmailAction(_ sender: Any) {
        signUpWithEmailNavigation()
    }
    
    @IBAction func alreadyHaveAnAccountButtonAction(_ sender: Any) {
        let navigation = storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        navigationController?.pushViewController(navigation, animated: true)
    }
}
