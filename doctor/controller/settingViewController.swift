//
//  settingViewController.swift
//  doctor
//
//  Created by achref on 9/11/2021.
//

import UIKit

class settingViewController: UIViewController{
    var userviewmodel = userVM()

    @IBOutlet weak var grandimage: UIImageView!
 
    
    
    
    @IBAction func deconnixion(_ sender: Any) {
        print(userviewmodel.isAuthenticated)
        userviewmodel.signout()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        grandimage.layer.borderWidth = 1
        grandimage.layer.masksToBounds = false
        grandimage.layer.borderColor = UIColor.black.cgColor
        grandimage.layer.cornerRadius = grandimage.frame.height/2
        grandimage.clipsToBounds = true
        // Do any additional setup after loading the view.
        userviewmodel.createtoken(email: "eya@gmail.com", password: "yea")
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "config"{
            let destination = segue.destination as! accountconfigViewController
            destination.userviewmodel = userviewmodel
     
            
        }
    }
    
    // action
    
    @IBAction func deconnexion(_ sender: Any) {
        performSegue(withIdentifier: "deconnexion", sender: sender)
    }
    
    @IBAction func changephoto(_ sender: Any) {
        performSegue(withIdentifier: "photo", sender: sender)
    }
    
    
    @IBAction func config(_ sender: Any) {
        performSegue(withIdentifier: "config", sender: sender)
    }
    
    @IBAction func language(_ sender: Any) {
        performSegue(withIdentifier: "language", sender: sender)
    }
}
