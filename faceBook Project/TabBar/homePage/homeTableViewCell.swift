//
//  homeTableViewCell.swift
//  Pods
//
//  Created by HARSHID PATEL on 11/08/23.
//

import UIKit

class homeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dpImag: UIImageView!
    @IBOutlet weak var writeButton: UIButton!
    @IBOutlet weak var storyCollectionView: UICollectionView!
    
    var object: ((IndexPath)->())?
    
    var dp = [UIImage(named: ""),UIImage(named: "harshid"),UIImage(named: "dharuDP"),UIImage(named: "harshDP"),UIImage(named: "hashuDP"),UIImage(named: "jenishDP"),UIImage(named: "monilDP"),UIImage(named: "jonathnDP"),UIImage(named: "khantilDP"),UIImage(named: "vivekDP"),UIImage(named: "yashDP")]
    
    var image = [UIImage(named: ""),UIImage(named: "harshid"),UIImage(named: "dharti"),UIImage(named: "harsh"),UIImage(named: "hashu"),UIImage(named: "jenish"),UIImage(named: "monil"),UIImage(named: "jonathnPost"),UIImage(named: "khantil"),UIImage(named: "vivekPost"),UIImage(named: "yash")]
    
    var name = ["","Harshid Vaddoriya","Dharti Raiyani","Harsh Rathod","Harsh Vaghasiya","Jenish Navadiya","Monil Sojitra","Jonathan Gaming","Khantil Vaddoriya","Vivek Rudkiya","Yash Patel"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        dpImag.layer.cornerRadius = dpImag.frame.width/2
        dpImag.layer.borderColor = UIColor.black.cgColor
        writeButton.layer.borderWidth = 1
        writeButton.layer.borderColor = UIColor.lightGray.cgColor
        writeButton.layer.cornerRadius = 22
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        storyCollectionView.delegate = self
        storyCollectionView.dataSource = self
    }
    
    @IBAction func imagPostButtonAction(_ sender: UIButton) {
        object!(IndexPath())
    }
}

//COLLECTION VIEW

extension homeTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dp.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "storyCell", for: indexPath) as! storyCollectionViewCell
            cell.layer.cornerRadius = 15
            
            return cell
        }
        else{
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "storyCell2", for: indexPath) as! storyCollectionViewCell2
            cell2.storyDpImage.layer.borderWidth = 2
            cell2.storyDpImage.layer.borderColor = UIColor.blue.cgColor
            cell2.storyDpImage.image = dp[indexPath.row]
            cell2.storyImage.image = image[indexPath.row]
            cell2.nameLable.text = name[indexPath.row]
            cell2.storyDpImage.layer.cornerRadius = cell2.storyDpImage.frame.width/2
            cell2.layer.cornerRadius = 15
            
            return cell2
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0{
            return CGSize(width: 104, height: 168)
        }
        else{
            return CGSize(width: 104, height: 168)
        }
    }
}

