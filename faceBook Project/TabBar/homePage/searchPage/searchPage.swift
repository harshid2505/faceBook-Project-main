//
//  searchPage.swift
//  faceBook Project
//
//  Created by HARSHID PATEL on 16/08/23.
//

import UIKit

struct Model{
    var dp: UIImage
    var name: String
}

class searchPage: UIViewController {
    
    @IBOutlet weak var searchTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var dpArr = [Model(dp: UIImage(named: "1")!, name: "Ashish Gondaliya"),Model(dp: UIImage(named: "2")!, name: "Rajesh Sakriya"),Model(dp: UIImage(named: "3")!, name: "Boghani Dhara"),Model(dp: UIImage(named: "4")!, name: "Gautam Baldha"),Model(dp: UIImage(named: "5")!, name: "Keval Patel"),Model(dp: UIImage(named: "6")!, name: "Thummar Abhi"),Model(dp: UIImage(named: "7")!, name: "Vishwas Mehta"),Model(dp: UIImage(named: "8")!, name: "Kailash Keer"),Model(dp: UIImage(named: "9")!, name: "VD Patel"),Model(dp: UIImage(named: "10")!, name: "Kaushik Makvana")]
    
    var dpArr2 = [Model(dp: UIImage(named: "1")!, name: "Ashish Gondaliya"),Model(dp: UIImage(named: "2")!, name: "Rajesh Sakriya"),Model(dp: UIImage(named: "3")!, name: "Boghani Dhara"),Model(dp: UIImage(named: "4")!, name: "Gautam Baldha"),Model(dp: UIImage(named: "5")!, name: "Keval Patel"),Model(dp: UIImage(named: "6")!, name: "Thummar Abhi"),Model(dp: UIImage(named: "7")!, name: "Vishwas Mehta"),Model(dp: UIImage(named: "8")!, name: "Kailash Keer"),Model(dp: UIImage(named: "9")!, name: "VD Patel"),Model(dp: UIImage(named: "10")!, name: "Kaushik Makvana")]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        let navigate = storyboard?.instantiateViewController(identifier: "HomePage") as! HomePage
        navigationController?.popViewController(animated: true)
    }
    
}

// TABLE VIEW

extension searchPage: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dpArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = searchTableView.dequeueReusableCell(withIdentifier: "searchCell") as! searchTableViewCell
            cell.dpImage.layer.cornerRadius = cell.dpImage.frame.width/2
            cell.dpImage.image = dpArr[indexPath.row].dp
            cell.nameLable.text = dpArr[indexPath.row].name
            
            return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 70
    }
    
}

// SEARCH BAR

extension searchPage: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == ""{
            dpArr = dpArr2
        }
        else{
            dpArr = dpArr2.filter({ $0.name.contains(searchText) })
        }
        searchTableView.reloadData()
    }
}
