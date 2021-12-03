//
//  securitycodeViewController.swift
//  doctor
//
//  Created by achref on 8/11/2021.
//

import UIKit

class securitycodeViewController: UIViewController {

    var userviewmodel = userVM()
    @IBOutlet weak var image: UIImageView!
    
    @IBAction func `continue`(_ sender: Any) {
        performSegue(withIdentifier: "password", sender: sender)
    }
    
    
    @IBOutlet weak var code: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        image.layer.borderWidth = 1
        image.layer.masksToBounds = false
        image.layer.borderColor = UIColor.black.cgColor
        image.layer.cornerRadius = image.frame.height/2
        image.clipsToBounds = true
        // Do any additional setup after loading the view.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "password"{
            let destination = segue.destination as! confirmresetpasswordViewController
            destination.userviewmodel = userviewmodel
     
            
        }    }

}
