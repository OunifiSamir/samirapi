//
//  OnBoardViewController.swift
//  doctor
//
//  Created by achref on 8/11/2021.
//

import UIKit

class OnBoardViewController: UIViewController {

   
    var nom : String?
     var userviewmodelm = userVM()
    @IBOutlet weak var professional: UIImageView!
    @IBOutlet weak var user: UIImageView!
    @IBOutlet weak var number: UITextField!
    @IBOutlet weak var conpassword: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var name: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    
    @IBAction func register(_ sender: UIButton) {
        userviewmodelm.createuser(nom: name.text!, prenom: name.text!, email: email.text!, password: password.text!, phone: number.text!, categorieclient: "CLIENT")
        performSegue(withIdentifier: "register", sender: sender)
        
    }
    
 
    @IBAction func sign(_ sender: Any) {
        performSegue(withIdentifier: "signin", sender: sender)
    }
    
}
