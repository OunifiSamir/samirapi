//
//  confirmationmailViewController2.swift
//  doctor
//
//  Created by achref on 14/11/2021.
//

import UIKit

class confirmationmailViewController2: UIViewController {

    @IBOutlet weak var `continue`: UIButton!
    @IBOutlet weak var code: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func cont(_ sender: Any) {
        performSegue(withIdentifier: "login", sender: sender)
    }
    
}
