import UIKit

class signupWithEmail: UIViewController {
    
    @IBOutlet weak var emailAddresssTxt: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var signUpWithMobileNumberButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSignUpWithMobileNumberButton()
        setNextButton()
    }
    
    func setNextButton(){
        nextButton.layer.cornerRadius = 20
    }
    
    func setSignUpWithMobileNumberButton(){
        signUpWithMobileNumberButton.layer.cornerRadius = 20
    }
    
    func backButtonNavigation(){
        let navigation = storyboard?.instantiateViewController(withIdentifier: "JoinFacebook") as! JoinFacebook
        navigationController?.popViewController(animated: true)
    }
    
    func nextButtonNavigation(){
        let navigation = storyboard?.instantiateViewController(withIdentifier: "createPassword") as! createPassword
        navigation.email = emailAddresssTxt.text!
        navigationController?.pushViewController(navigation, animated: true)
    }
    
    func signupWithMobileNumberButtonNavigation(){
        let navigation = storyboard?.instantiateViewController(withIdentifier: "mobileNumber") as! mobileNumber
        navigationController?.popViewController(animated: true)
    }
    
    func alert(){
        let alert = UIAlertController.init(title: "Enter a email address", message: "You'll need to enter a email to continue.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive))
        present(alert, animated: true)
    }

    
    @IBAction func backButtonAction(_ sender: Any) {
        backButtonNavigation()
    }
    
    @IBAction func nextButtonNavigation(_ sender: Any) {
        if emailAddresssTxt.text == ""{
            alert()
        }
        else{
            nextButtonNavigation()
        }
    }
    
    @IBAction func signupWithMobileNumberAction(_ sender: Any) {
        signupWithMobileNumberButtonNavigation()
    }
    
    @IBAction func alreadyhaveAnAccountButtonAction(_ sender: Any) {
        let navigation = storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        navigationController?.pushViewController(navigation, animated: true)
    }
}
