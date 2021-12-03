//
//  homeViewController.swift
//  doctor
//
//  Created by achref on 9/11/2021.
//

import UIKit
extension UIColor {
    convenience init(hex: UInt, alpha: CGFloat = 1) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}
class homeViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var profilpicture: UIImageView!
    
    var data = ["samir","achref","ahmed"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           
           return data.count //6 elements
       }
       
       
       
       
       
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
           tableView.backgroundColor = UIColor(hex: 0xE6FAF0)
           let cell = tableView.dequeueReusableCell(withIdentifier: "mCell")
           let contentView = cell?.contentView
           
           let label = contentView?.viewWithTag(1) as! UILabel
           let text = contentView?.viewWithTag(3) as! UILabel
           let imageView = contentView?.viewWithTag(2) as! UIImageView
           
           imageView.layer.masksToBounds = false
           imageView.layer.borderColor = UIColor.black.cgColor
           imageView.layer.cornerRadius = imageView.frame.height/2
           imageView.clipsToBounds = true
           label.text = data[indexPath.row]
           text.text = "hello hello hello put a question here hello hello hello put a question here hello hello hello put a question here hello hello hello put a question herehello hello hello put a question here"
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
        profilpicture.layer.borderWidth = 1
        profilpicture.layer.masksToBounds = false
        profilpicture.layer.borderColor = UIColor.black.cgColor
        profilpicture.layer.cornerRadius = profilpicture.frame.height/2
        profilpicture.clipsToBounds = true
        // Do any additional setup after loading the view.
    }
    

 //action
    
    
    @IBAction func donate(_ sender: Any) {
        performSegue(withIdentifier: "donateSegue", sender: sender)
    }
    
    
    @IBAction func addquestion(_ sender: Any) {
        performSegue(withIdentifier: "newQuestion", sender: sender)
    }
    
}
