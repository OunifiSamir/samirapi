//
//  QRViewController.swift
//  doctor
//
//  Created by SAMIR OUNIFI on 1/12/2021.
//

import UIKit

class QRViewController: UIViewController {

    @IBOutlet weak var NOM: UITextField!
    @IBOutlet weak var imageview: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   
    @IBAction func createbtnpresse(_ sender: Any) {
        
        
        if let myString = NOM.text{
            
            imageview.image = generateQRCode(from: NOM.text!)
            
        }else {
            imageview.image = generateQRCode(from: "try again!")
        }
    }
    
    
    func generateQRCode(from string:String) -> UIImage? {
        
        let data = string.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator"){
            
            filter.setValue(data, forKey: "inputMessage")
            
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
            
        }
        
        return nil
        
    }
}
