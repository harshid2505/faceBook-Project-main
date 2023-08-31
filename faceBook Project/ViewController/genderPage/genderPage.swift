//
//  genderPage.swift
//  faceBook Project
//
//  Created by HARSHID PATEL on 02/08/23.
//

import UIKit

class genderPage: UIViewController {
    
    @IBOutlet weak var genderTableView: UITableView!
    @IBOutlet weak var nextButton: UIButton!
    
    var genderArr = ["Female","Male","Another Gender"]
    var selectCell = -1

    override func viewDidLoad() {
        super.viewDidLoad()
        
        genderTableView.layer.cornerRadius = 10
        nextButton.layer.cornerRadius = 22

        // Do any additional setup after loading the view.
    }
    
    func nextButtonNavigation(){
        let navigation = storyboard?.instantiateViewController(withIdentifier: "mobileNumber") as! mobileNumber
        navigationController?.pushViewController(navigation, animated: true)
    }
    
    func alert(){
        let alert = UIAlertController.init(title: "Select the gender", message: "You'll need to select gender to continue.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive))
        present(alert, animated: true)
    }
    
    @IBAction func nextButtonAction(_ sender: UIButton) {
        if selectCell == -1{
            alert()
        }
        else{
            nextButtonNavigation()
        }
    }
    
    @IBAction func alreadyAccountButtonAction(_ sender: UIButton) {
        let navigation = storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        navigationController?.pushViewController(navigation, animated: true)
    }
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "dateOfBirth") as! dateOfBirth
        navigationController?.popViewController(animated: true)
    }
}

//TABLE VIEW

extension genderPage:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genderArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = genderTableView.dequeueReusableCell(withIdentifier: "genderCell") as! genderTableViewCell
        cell.genderLable.text = genderArr[indexPath.row]
        
        if selectCell == indexPath.row{
            cell.redioButton.image = UIImage(systemName: "circle.inset.filled")
        }
        else{
            cell.redioButton.image = UIImage(systemName: "circle")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectCell = indexPath.row
        genderTableView.reloadData()
    }
    
}

