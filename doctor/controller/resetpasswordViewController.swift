//
//  resetpasswordViewController.swift
//  doctor
//
//  Created by achref on 8/11/2021.
//

import UIKit

class resetpasswordViewController: UIViewController {
    var userviewmodel = userVM()

  
    @IBOutlet weak var number: UIImageView!
    @IBOutlet weak var email: UIImageView!
    @IBOutlet weak var imageacchount: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        imageacchount.layer.borderWidth = 1
        imageacchount.layer.masksToBounds = false
        imageacchount.layer.borderColor = UIColor.black.cgColor
        imageacchount.layer.cornerRadius = imageacchount.frame.height/2
        imageacchount.clipsToBounds = true
        // Do any additional setup after loading the view.
        
      
    }
    @IBAction func send(_ sender: Any) {
        performSegue(withIdentifier: "password", sender: sender)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "password"{
            let destination = segue.destination as! securitycodeViewController
            destination.userviewmodel = userviewmodel
     
            
        }    }

}
