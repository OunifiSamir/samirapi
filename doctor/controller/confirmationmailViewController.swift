//
//  confirmationmailViewController.swift
//  doctor
//
//  Created by achref on 9/11/2021.
//

import UIKit

class confirmationmailViewController: UIViewController {

    @IBOutlet weak var `continue`: UIButton!
    @IBOutlet weak var code: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   
    @IBAction func continu(_ sender: Any) {
        performSegue(withIdentifier: "pass", sender: sender)
    }
    
}
