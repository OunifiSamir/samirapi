//
//  donation1ViewController.swift
//  doctor
//
//  Created by achref on 9/11/2021.
//

import UIKit

class donation1ViewController: UIViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    

    @IBAction func donate(_ sender: Any) {
        performSegue(withIdentifier: "pass", sender: sender)
    }
    
}
