import UIKit

class createAccount: UIViewController {
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNextButton()
    }
    
    func setNextButton(){
        nextButton.layer.cornerRadius = 20
    }
    
    func backButtonNavigation(){
        let navigation = storyboard?.instantiateViewController(withIdentifier: "JoinFacebook") as! JoinFacebook
        navigationController?.popViewController(animated: true)
    }
    
    func alreadyHaveAnAccount(){
        let navigation = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        navigationController?.pushViewController(navigation, animated: true)
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        if firstName.text == "" && lastName.text == ""{
            firstName.layer.borderWidth = 2
            firstName.layer.cornerRadius = 5
            firstName.layer.borderColor = UIColor.red.cgColor
            img1.image = UIImage(systemName: "xmark.circle")
            lastName.layer.borderWidth = 2
            lastName.layer.cornerRadius = 5
            lastName.layer.borderColor = UIColor.red.cgColor
            img2.image = UIImage(systemName: "xmark.circle")
        }
        
        else if firstName.text == ""{
            firstName.layer.borderWidth = 2
            firstName.layer.cornerRadius = 5
            firstName.layer.borderColor = UIColor.red.cgColor
            img1.image = UIImage(systemName: "xmark.circle")
        }
        
        else if lastName.text == ""{
            lastName.layer.borderWidth = 2
            lastName.layer.cornerRadius = 5
            lastName.layer.borderColor = UIColor.red.cgColor
            img2.image = UIImage(systemName: "xmark.circle")
        }
        
        else{
            firstName.layer.borderWidth = 0
            firstName.layer.cornerRadius = 0
            firstName.layer.borderColor = UIColor.red.cgColor
            img1.image = UIImage(systemName: "")
            lastName.layer.borderWidth = 0
            lastName.layer.cornerRadius = 0
            lastName.layer.borderColor = UIColor.red.cgColor
            img2.image = UIImage(systemName: "")
            let navigation = storyboard?.instantiateViewController(withIdentifier: "dateOfBirth") as! dateOfBirth
            navigationController?.pushViewController(navigation, animated: true)
        }
    }
    
    @IBAction func AlreadyHaveAnAccountButtonAction(_ sender: Any) {
        alreadyHaveAnAccount()
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        backButtonNavigation()
    }
}
