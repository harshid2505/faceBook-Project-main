//
//  example.swift
//  faceBook Project
//
//  Created by HARSHID PATEL on 05/09/23.
//

import UIKit
import FirebaseStorage
import FirebaseDatabase
import FirebaseFirestore
import FirebaseAuth
import SDWebImage

struct Data2{
    var userPost: String
}

class example: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var postTableview: UITableView!
    
    var arr2 = [Data2]()
    var arrPost = [String]()
    var collRef: CollectionReference!
    var ref = Database.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        getData()
    }
    
    func getData(){
        collRef = Firestore.firestore().collection("Posts")
        collRef.addSnapshotListener { [self] documentSnapshot, error in
            if error == nil{
                arr2 = documentSnapshot!.documents.map({ document in
                    return Data2(userPost: document["Post"] as! String)
                })
                postTableview.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = postTableview.dequeueReusableCell(withIdentifier: "exampleCell") as! exampleTableViewCell
        cell.postImage.sd_setImage(with: URL(string: arr2[indexPath.row].userPost))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
}
