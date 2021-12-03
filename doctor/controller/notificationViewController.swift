//
//  notificationViewController.swift
//  doctor
//
//  Created by achref on 9/11/2021.
//

import UIKit

class notificationViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

  
    @IBOutlet weak var profileimage: UIImageView!
    
    var data = ["samir","achref","ahmed"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           
           return data.count //6 elements
       }
       
       
       
       
       
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
           tableView.backgroundColor = UIColor(hex: 0xE6FAF0)
           let cell = tableView.dequeueReusableCell(withIdentifier: "mCell")
           let contentView = cell?.contentView
           
           let label = contentView?.viewWithTag(1) as! UILabel
      
           let imageView = contentView?.viewWithTag(2) as! UIImageView
           
           imageView.layer.masksToBounds = false
           imageView.layer.borderColor = UIColor.black.cgColor
           imageView.layer.cornerRadius = imageView.frame.height/2
           imageView.clipsToBounds = true
           label.text = data[indexPath.row]
          
           imageView.image = UIImage(named: data[indexPath.row])
           
           
           
           return cell!
           
       }
       
       
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           
           
       }
       
       
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           
           let movie = data[indexPath.row]
           performSegue(withIdentifier: "mSegue", sender: movie)
           
       }
    override func viewDidLoad() {
        super.viewDidLoad()
        profileimage.layer.borderWidth = 1
        profileimage.layer.masksToBounds = false
        profileimage.layer.borderColor = UIColor.black.cgColor
        profileimage.layer.cornerRadius = profileimage.frame.height/2
        profileimage.clipsToBounds = true
        // Do any additional setup after loading the view.
    }
    

   
    //action
    
    
    @IBAction func donate(_ sender: Any) {
        performSegue(withIdentifier: "donateSegue", sender: sender)
    }
    
}
