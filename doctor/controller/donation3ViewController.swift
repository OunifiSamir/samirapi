//
//  donation3ViewController.swift
//  doctor
//
//  Created by achref on 9/11/2021.
//

import UIKit

class donation3ViewController: UIViewController {

  
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    
    @IBAction func home(_ sender: Any) {
        performSegue(withIdentifier: "home", sender: sender)
    }
    
}
