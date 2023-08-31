//
//  homeTableViewCell3.swift
//  faceBook Project
//
//  Created by HARSHID PATEL on 15/08/23.
//

import UIKit

class homeTableViewCell3: UITableViewCell {
    
    @IBOutlet weak var friendCV: UICollectionView!
    
    var dp = [UIImage(named: "1"),UIImage(named: "2"),UIImage(named: "3"),UIImage(named: "4"),UIImage(named: "5"),UIImage(named: "6"),UIImage(named: "7"),UIImage(named: "8"),UIImage(named: "9"),UIImage(named: "10")]
    
    var name = ["Ashish Gondaliya","Rajesh Sakriya","Boghani Dhara","Gautam Baldha","Keval Patel","Thummar Abhi","Vishwas Mehta","Kailash Keer","VD Patel","Kaushik Makvana"]
    
    var fraind = ["12 mutual friends","13 mutual friends","8 mutual friends","84 mutual friends","32 mutual friends","45 mutual friends","1 mutual friends","16 mutual friends","7 mutual friends","1 mutual friends"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        friendCV.delegate = self
        friendCV.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

// COLLECTION VIEW

extension homeTableViewCell3:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dp.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = friendCV.dequeueReusableCell(withReuseIdentifier: "friendReqCell", for: indexPath) as! friendReqCollectionViewCell
        cell.layer.cornerRadius = 15
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.systemGray3.cgColor
        cell.dpImage.image = dp[indexPath.row]
        cell.nameLable.text = name[indexPath.row]
        cell.friendLable.text = fraind[indexPath.row]
        cell.confirmButton.layer.cornerRadius = 5
        cell.deleteButton.layer.cornerRadius = 5
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 301, height: 390)
    }
    
}
