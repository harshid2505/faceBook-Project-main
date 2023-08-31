import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseFirestore
import FirebaseCore

class ViewController: UIViewController {
    
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var createNewButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var refa: Firestore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLogInButton()
        refa = Firestore.firestore()
    }
    
    func setLogInButton(){
        logInButton.layer.cornerRadius = 22
        createNewButton.layer.borderWidth = 1.5
        createNewButton.layer.borderColor = UIColor.tintColor.cgColor
        createNewButton.layer.cornerRadius = 18
    }
    
    func logIn(){
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!){authDataResult, error in
            if error == nil{
                let navigate = self.storyboard?.instantiateViewController(identifier: "saveLoginInfoPage") as! saveLoginInfoPage
                self.navigationController?.pushViewController(navigate, animated: true)
            }
            else{
                self.alert(title: "Error", message: error!.localizedDescription)
            }
        }
    }
    
    func alert(title:String,message:String){
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive))
        present(alert, animated: true)
    }
    
    @IBAction func logInButtonAction(_ sender: UIButton) {
        
        if emailTextField.text == "" && passwordTextField.text == ""{
            alert(title: "Error", message: "Plese Enter Your Username & Password.")
        }
        
        else if emailTextField.text == ""{
            alert(title:"Error",message: "Plese Enter Your Username.")
        }
        
        else if passwordTextField.text == ""{
            alert( title:"Erorr",message: "Plese Enter Your Password.")
        }
        logIn()
        
    }
    
    @IBAction func crateNewButtonAction(_ sender: Any) {
        let navigation = storyboard?.instantiateViewController(withIdentifier: "JoinFacebook") as! JoinFacebook
        navigationController?.pushViewController(navigation, animated: true)
    }
    
    @IBAction func forgotPasswordButtonActio(_ sender: Any) {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "forgetPage") as! forgetPage
        navigationController?.pushViewController(navigate, animated: true)
    }
}

