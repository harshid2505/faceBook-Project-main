//
//  birthdayPop.swift
//  faceBook Project
//
//  Created by HARSHID PATEL on 25/07/23.
//

import UIKit

class birthdayPop: UIViewController {
    
    @IBOutlet weak var popView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.alpha = 0
        popView.layer.cornerRadius = 15
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.5, delay: 0,options: .curveLinear){
            self.view.alpha = 1
        }
    }
    
    @IBAction func closeButtonAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true)
    }
}
