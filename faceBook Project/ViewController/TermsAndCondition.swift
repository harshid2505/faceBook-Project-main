import UIKit

class TermsAndCondition: UIViewController {
    
    @IBOutlet weak var iAgreeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setiAgreeButton()
   }
    func setiAgreeButton(){
        iAgreeButton.layer.cornerRadius = 20
    }
    func alreadyHaveAnAccount(){
        let navigation = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        navigationController?.pushViewController(navigation, animated: true)
    }
    func backButtonNavigation(){
        let navigation = storyboard?.instantiateViewController(withIdentifier: "saveInfo") as! saveInfo
        navigationController?.popViewController(animated: true)
    }
    func iAgreeButtonNavigation(){
        let navigation = storyboard?.instantiateViewController(withIdentifier: "saveLoginInfoPage") as! saveLoginInfoPage
        navigationController?.pushViewController(navigation, animated: true)
    }
    @IBAction func backButtonAction(_ sender: Any) {
        backButtonNavigation()
    }
    @IBAction func iAgreeButtonAction(_ sender: Any) {
        iAgreeButtonNavigation()
    }
    @IBAction func alreadyHaveAnAccountButtonAction(_ sender: Any) {
        alreadyHaveAnAccount()
    }
}
