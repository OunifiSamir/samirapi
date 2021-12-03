//
//  donation2ViewController.swift
//  doctor
//
//  Created by achref on 9/11/2021.
//

import UIKit

class donation2ViewController: UIViewController {

    @IBAction func donate(_ sender: Any) {
        performSegue(withIdentifier: "pass", sender: sender)
    }
    @IBOutlet weak var card: UITextField!
    @IBOutlet weak var money: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    

  

}
