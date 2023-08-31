
import UIKit
import FirebaseAuth
import FirebaseCore
import FirebaseDatabase
import FirebaseFirestore

class forgetPage: UIViewController {
    
    @IBOutlet weak var mobileLb: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    
    var change = 0
    var refa = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        forgotPasswordButton.layer.cornerRadius = 22
    }
    
    func resetPasseord(){
        Auth.auth().sendPasswordReset(withEmail: emailTextField.text!){ [self] error in
            if error == nil{
                print("Success")
            }
            else{
                print(error?.localizedDescription)
            }
        }
    }
    
    func alert(title:String,message:String){
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive))
        present(alert, animated: true)
    }
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        let navigate = storyboard?.instantiateViewController(identifier: "ViewController") as!
        ViewController
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func forgotPasswordButtonAction(_ sender: UIButton) {
        
        if emailTextField.placeholder == "Email"{
            if emailTextField.text == ""{
                alert(title: "Enter a email address", message: "You'll need to enter a email to continue.")
            }
            else{
                resetPasseord()
            }
        }
        else{
            if emailTextField.text!.count <= 9{
                alert(title: "Enter a mobile number", message: "You'll need to enter a 10 digit number to continue.")
            }
            else{
                print("yes")
            }
        }
        
    }
    
    @IBAction func searchButtonAction(_ sender: UIButton) {
        if change == 0{
            emailTextField.placeholder = "Mobile number"
            searchButton.setTitle("Search by email instead", for: .normal)
            mobileLb.text = "Enter your mobile number."
            change = 1
        }
        else{
            emailTextField.placeholder = "Email"
            searchButton.setTitle("Search by mobile number instead", for: .normal)
            mobileLb.text = "Enter your email address."
            change = 0
        }
    }
    
    @IBAction func alreadyAccountButtonAction(_ sender: UIButton) {
        let navigation = storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        navigationController?.pushViewController(navigation, animated: true)
    }
    
}
