//
//  findaccountViewController.swift
//  doctor
//
//  Created by achref on 8/11/2021.
//

import UIKit

class findaccountViewController: UIViewController {

    var userviewmodel  = userVM()
    
    @IBAction func searchmail(_ sender: Any) {
        userviewmodel.getbyemail(email: find.text!)
        print(find.text!)
        
    }
    
    @IBOutlet weak var search: UIButton!
    @IBOutlet weak var find: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "password"{
            let destination = segue.destination as! resetpasswordViewController
            destination.userviewmodel = userviewmodel
     
            
        }
    }

    @IBAction func sear(_ sender: Any) {
        performSegue(withIdentifier: "password", sender: sender)
    }
    
}
