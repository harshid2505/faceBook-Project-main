//
//  postPop.swift
//  faceBook Project
//
//  Created by HARSHID PATEL on 10/08/23.
//

import UIKit

class postPop: UIViewController {

    @IBOutlet weak var popPop: UIView!
    @IBOutlet weak var postTableView: UITableView!
    
    var object: ((IndexPath)->())?
    var object2: ((IndexPath)->())?
    
    var photo = [UIImage(named: "post"),UIImage(named: "story"),UIImage(named: "reel"),UIImage(named: "live")]
    var name = ["Post","Story","Reel","Live"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.alpha = 0
        popPop.layer.cornerRadius = 15
        postTableView.layer.cornerRadius = 15
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.5, delay: 0,options: .curveLinear){
            self.view.alpha = 1
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: false)
    }
}

//TABLE VIEW

extension postPop:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = postTableView.dequeueReusableCell(withIdentifier: "postCell") as! postTableViewCell
        cell.imgView.image = photo[indexPath.row]
        cell.lable.text = name[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            object!(IndexPath())
        }
        else{
            object2!(IndexPath())
        }
        
    }
    
}
