import UIKit

class dateOfBirth: UIViewController {
    
    @IBOutlet weak var birthDateField: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!
    
    let datePiker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.layer.cornerRadius = 22
        
        createDatePiker()
    }
    
    func createToolBar() -> UIToolbar{
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePress))
        
        toolBar.setItems([doneButton], animated: true)
        
        return toolBar
    }
    
    func createDatePiker(){
        datePiker.preferredDatePickerStyle = .wheels
        datePiker.datePickerMode = .date
        birthDateField.textAlignment = .center
        birthDateField.inputView = datePiker
        birthDateField.inputAccessoryView = createToolBar()
    }
    
    func alert(){
        let alert = UIAlertController.init(title: "Select the date of birth", message: "You'll need to enter a date of birth to continue.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive))
        present(alert, animated: true)
    }
    
    @objc func donePress(){
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .medium
        dateFormater.timeStyle = .none
        self.birthDateField.text = dateFormater.string(from: datePiker.date)
        self.view.endEditing(true)
    }
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        let navigate = storyboard?.instantiateViewController(identifier: "createAccount") as! createAccount
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func iNeedButtonAction(_ sender: UIButton) {
        let navigate = storyboard?.instantiateViewController(identifier: "birthdayPop") as! birthdayPop
        present(navigate, animated: false)
    }
    
    @IBAction func nextButtonAction(_ sender: UIButton) {
        if birthDateField.text == ""{
            alert()
        }
        else{
            let navigation = storyboard?.instantiateViewController(identifier: "genderPage") as! genderPage
            navigationController?.pushViewController(navigation, animated: true)
        }
    }
    
    @IBAction func alreadyAccountButtonAction(_ sender: UIButton) {
        let navigation = storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        navigationController?.pushViewController(navigation, animated: true)
    }
    
}
