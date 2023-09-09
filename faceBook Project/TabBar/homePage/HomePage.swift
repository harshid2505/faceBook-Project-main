//
//  HomePage.swift
//  faceBook Project
//
//  Created by HARSHID PATEL on 10/08/23.
//

import UIKit
import FirebaseStorage
import FirebaseDatabase
import FirebaseFirestore
import FirebaseAuth
import SDWebImage

struct LikeShareCount{
    var like: String
    var share: String
}

struct Data{
    var userPost: String
}

class HomePage: UIViewController {
    
    @IBOutlet weak var homeTableView: UITableView!
    
    var arr = [Data]()
    var collRef: CollectionReference!
    var ref = Database.database().reference()
    
    var dp = [UIImage(named: ""),UIImage(named: "dp"),UIImage(named: "harshid"),UIImage(named: "dharuDP"),UIImage(named: "monilDP"),UIImage(named: "jenishDP"),UIImage(named: ""),UIImage(named: "hashuDP"),UIImage(named: "harshDP"),UIImage(named: "jonathnDP"),UIImage(named: "khantilDP"),UIImage(named: "vivekDP")]
    
    var name = ["","Digital Gamerz","Harshid Vaddoriya","Dharti Raiyani","Sojitra Monil","Jenish Navadiya","","Vaghasiya Harsh","Harsh Rathod","Jonathn Gaming","Khantil Vaddoriya","Rudakiya Vivek"]
    
    var name2 = ["","Suggested for you ⋅ 2d","Suggested for you ⋅ 1h","Suggested for you ⋅ 9h","Suggested for you ⋅ 7d","Suggested for you ⋅ 10d","","Suggested for you ⋅ 5m","Suggested for you ⋅ Jul 27","Suggested for you ⋅ May 25","Suggested for you ⋅ 5d","Suggested for you ⋅ Jun 6"]
    
    var post = [UIImage(named: ""),UIImage(named: "bachuPost"),UIImage(named: "harshid"),UIImage(named: "dharti"),UIImage(named: "monil"),UIImage(named: "jenishPost"),UIImage(named: ""),UIImage(named: "hashu"),UIImage(named: "subhmanPost"),UIImage(named: "jonathnPost"),UIImage(named: "khantilPost"),UIImage(named: "vivekPost")]
    
    var like = [LikeShareCount(like: "", share: ""),LikeShareCount(like: "345K", share: "476 comments ⋅ 279 shares"),LikeShareCount(like: "514K", share: "700 comments ⋅ 80 shares"),LikeShareCount(like: "1M", share: "100K comments ⋅ 80K shares"),LikeShareCount(like: "80K", share: "40K comments ⋅ 5K shares"),LikeShareCount(like: "115", share: "35 comments ⋅ 17 shares"),LikeShareCount(like: "", share: ""),LikeShareCount(like: "800", share: "376 comments ⋅ 112 shares"),LikeShareCount(like: "12M", share: "800K comments ⋅ 1.3M shares"),LikeShareCount(like: "765K", share: "543 comments ⋅ 432 shares"),LikeShareCount(like: "2.2M", share: "53.3K comments ⋅ 20.2K shares"),LikeShareCount(like: "35.7K", share: "2.2K comments ⋅ 12.8K shares")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        getData()
    }
    
    func showAlert(a: IndexPath){
        let alert = UIAlertController(title: "Your Choice", message: "Photos", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction.init(title: "Gallery", style: .default,handler: { _ in
            self.openGallery()
        }))
        alert.addAction(UIAlertAction.init(title: "Camera", style: .default,handler: nil))
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive,handler: nil))
        present(alert, animated: true,completion: nil)
    }
    
    func navigation(a: IndexPath){
        let navigate = storyboard?.instantiateViewController(identifier: "postPage") as! postPage
        navigationController?.pushViewController(navigate, animated: true)
    }
    
    func getData(){
        collRef = Firestore.firestore().collection("Post")
        collRef.addSnapshotListener { [self] documentSnapshot, error in
            if error == nil{
                arr = documentSnapshot!.documents.map({ document in
                    return Data(userPost: document["Post"] as! String)
                })
                homeTableView.reloadData()
            }
        }
    }
    
    @IBAction func postButtonAction(_ sender: UIButton) {
        let navigate = storyboard?.instantiateViewController(identifier: "postPop") as! postPop
        navigate.object = navigation
        navigate.object2 = showAlert
        
        present(navigate, animated: true)
    }
    
    @IBAction func searchButtonAction(_ sender: UIButton) {
        let navigate = storyboard?.instantiateViewController(identifier: "searchPage") as! searchPage
        navigationController?.pushViewController(navigate, animated: true)
    }
    
    @IBAction func messageButtonAction(_ sender: UIButton) {
        let navigate = storyboard?.instantiateViewController(identifier: "messagerPage") as! messagerPage
        navigationController?.pushViewController(navigate, animated: true)
    }
    
}

//TABLE VIEW

extension HomePage:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dp.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            let cell = homeTableView.dequeueReusableCell(withIdentifier: "homeCell") as! homeTableViewCell
            cell.object = navigation
            
            return cell
        }
        else if indexPath.row == 6{
            let cell3 = homeTableView.dequeueReusableCell(withIdentifier: "homeCell3") as! homeTableViewCell3
            cell3.layer.backgroundColor = UIColor.black.cgColor
            
            return cell3
        }
        else{
            let cell2 = homeTableView.dequeueReusableCell(withIdentifier: "homeCell2") as! homeTableViewCell2
            cell2.dpImageView.image = dp[indexPath.row]
            cell2.nameLable.text = name[indexPath.row]
            cell2.lable.text = name2[indexPath.row]
            cell2.postImageView.image = post[indexPath.row]
            //            cell2.postImageView.sd_setImage(with: URL(string: arr[indexPath.row].userPost))
            cell2.likeCountLable.text = like[indexPath.row].like
            cell2.shareCountLable.text = like[indexPath.row].share
            cell2.dpImageView.layer.cornerRadius = cell2.dpImageView.frame.width/2
            
            return cell2
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 260
        }
        else if indexPath.row == 6{
            return 480
        }
        else{
            return 510
        }
    }
}

// IMAGE PIKER

extension HomePage:  UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    func openGallery(){
        let gallery = UIImagePickerController()
        gallery.delegate = self
        gallery.sourceType = .photoLibrary
        gallery.allowsEditing = true
        
        present(gallery, animated: true,completion: nil)
    }
}

