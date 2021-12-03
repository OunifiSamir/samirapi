//
//  Launch2ViewController.swift
//  doctor
//
//  Created by achref on 7/11/2021.
//

import UIKit

class Launch2ViewController: UIViewController {

    @IBAction func start(_ sender: UIButton) {
        performSegue(withIdentifier: "pass", sender: sender)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    



}
