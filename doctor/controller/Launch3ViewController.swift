//
//  Launch3ViewController.swift
//  doctor
//
//  Created by achref on 7/11/2021.
//

import UIKit

class Launch3ViewController: UIViewController {

    var userviewmodel = userVM()
    @IBAction func start(_ sender: UIButton) {
        performSegue(withIdentifier: "pass", sender: sender)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
     //   userviewmodel.getallusers()
       // userviewmodel.createtoken(email: "achref@gmail.com", password: "123")

    }
    

 /*   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        userviewmodel.getuserfromtoken(token: userviewmodel.tokenString!)
        
        if segue.identifier == "nom" {
            let destination = segue.destination as! OnBoardViewController
            destination.nom = userviewmodel.userdata[1].nom
        }
    }*/

}
