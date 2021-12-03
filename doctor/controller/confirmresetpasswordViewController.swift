//
//  confirmresetpasswordViewController.swift
//  doctor
//
//  Created by achref on 8/11/2021.
//

import UIKit

class confirmresetpasswordViewController: UIViewController {
    var userviewmodel = userVM()
    @IBAction func `continue`(_ sender: Any) {
        userviewmodel.updateuser(id: (userviewmodel.userByemail?._id)!, nom: (userviewmodel.userByemail?.nom)!,
                                 prenom: (userviewmodel.userByemail?.prenom)!, email: (userviewmodel.userByemail?.email)!
                                 , password: password.text!, phone: (userviewmodel.userByemail?.phone)!, categorieclient: (userviewmodel.userByemail?.categorieclient)!)
        performSegue(withIdentifier: "change", sender: sender)
    }
    
    @IBOutlet weak var confpassword: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        image.layer.borderWidth = 1
        image.layer.masksToBounds = false
        image.layer.borderColor = UIColor.black.cgColor
        image.layer.cornerRadius = image.frame.height/2
        image.clipsToBounds = true
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
