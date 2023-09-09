//
//  postPage.swift
//  faceBook Project
//
//  Created by HARSHID PATEL on 01/09/23.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseDatabase
import FirebaseFirestore
import FirebaseStorage

class postPage: UIViewController {
    
    @IBOutlet weak var imageForUpload: UIImageView!
    @IBOutlet weak var selectButton: UIButton!
    
    var ref: DatabaseReference!
    var fir: Firestore!
    var arrPost = ""
    let userUid = Auth.auth().currentUser!.uid
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonSet()
        ref = Database.database().reference()
        fir = Firestore.firestore()
        print(arrPost)
    }
    
    func buttonSet(){
        selectButton.layer.cornerRadius = 8
        selectButton.layer.shadowColor = UIColor.black.cgColor
        selectButton.layer.shadowOpacity = 0.5
        selectButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        selectButton.layer.shadowRadius = 4
    }
    
    func imageAlert(){
        let alert = UIAlertController(title: "Your Choice", message: "Photos", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction.init(title: "Gallery", style: .default,handler: { _ in
            self.openGallery()
        }))
        alert.addAction(UIAlertAction.init(title: "Camera", style: .default,handler: nil))
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive,handler: nil))
        present(alert, animated: true,completion: nil)
    }
    
    func uploadPost(_ image:UIImage,complition:@escaping((_ url:URL?)->())){
        let storageRef = Storage.storage().reference().child("UserImages.png")
        let imageData = imageForUpload.image?.pngData()
        let metaData = StorageMetadata()
        metaData.contentType = "image/png"
        
        storageRef.putData(imageData!,metadata: metaData) { metaData, error in
            if error == nil{
                print("Success")
                storageRef.downloadURL {[self] url, error in
                    complition(url)
                }
            }
            else{
                print("Error !")
            }
        }
    }
    
    func saveImage(profileImageUrl:URL,complition:@escaping((_ url:URL?)->())){
        let userUid = Auth.auth().currentUser!.uid
        
        self.fir.collection("Posts").document().parent.addDocument(data: ["Post":profileImageUrl.absoluteString])
    }
    
    func saveFirData() {
        
        self.uploadPost(imageForUpload.image!) { url in
            self.saveImage(profileImageUrl: url!) { success in
                if success != nil{
                    print("Done")
                }
            }
        }
    }
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        let navigate = storyboard?.instantiateViewController(identifier: "HomePage") as! HomePage
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func postButtonAction(_ sender: UIButton) {
        let navigate = storyboard?.instantiateViewController(identifier: "example") as! example
        navigationController?.pushViewController(navigate, animated: true)
        saveFirData()
    }
    
    @IBAction func selectImageButtonAction(_ sender: UIButton) {
        imageAlert()
    }
    
}

// IMAGE PIKER

extension postPage:  UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    func imagePickerController(_ piker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        imageForUpload.image = info[.editedImage] as! UIImage
        dismiss(animated: true,completion: nil)
    }
    
    func openGallery(){
        let gallery = UIImagePickerController()
        gallery.delegate = self
        gallery.sourceType = .photoLibrary
        gallery.allowsEditing = true
        
        present(gallery, animated: true,completion: nil)
    }
}
