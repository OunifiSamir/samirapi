//
//  chnagephotoViewController.swift
//  doctor
//
//  Created by achref on 9/11/2021.
//

import UIKit

class chnagephotoViewController: UIViewController {

    @IBOutlet weak var grandimage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        
        
        grandimage.layer.borderWidth = 1
        grandimage.layer.masksToBounds = false
        grandimage.layer.borderColor = UIColor.black.cgColor
        grandimage.layer.cornerRadius = grandimage.frame.height/2
        grandimage.clipsToBounds = true
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
