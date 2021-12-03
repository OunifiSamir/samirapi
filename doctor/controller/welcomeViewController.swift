//
//  welcomeViewController.swift
//  doctor
//
//  Created by achref on 8/11/2021.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class welcomeViewController: UIViewController, LoginButtonDelegate {
    
    
   
    

    var userviewmodel = userVM()
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
           
            if let token = AccessToken.current, !token.isExpired {    //apell du token
            
            let token = token.tokenString                             // cast token
            
            let request = FBSDKLoginKit.GraphRequest(graphPath: "me",                            //reponse token email + name
                                                     parameters: ["fields": "email , name"],
                                                     tokenString: token,
                                                     version: nil,
                                                     httpMethod: .get)
            
            request.start { connection, result, error in                                         //resultat token
                print("\(result)")
            }
            
            
        }else{
            let loginButton = FBLoginButton()                                  //if resultat valide
            loginButton.center = view.center
            loginButton.delegate = self
            
            loginButton.permissions = ["public_profile", "email"]
            
            view.addSubview(loginButton)
            
            
        }
        
    }
    
    @IBAction func signup(_ sender: Any) {
        performSegue(withIdentifier: "signup", sender: sender)
    }
    
    @IBAction func login(_ sender: Any) {
        userviewmodel.createtoken(email: email.text!, password: password.text!)
        performSegue(withIdentifier: "login", sender: sender)
    }
   
    
    @IBAction func forgetpass(_ sender: Any) {
        performSegue(withIdentifier: "find", sender: sender)
    }
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
       
              let token = result?.token?.tokenString
              
              let request = FBSDKLoginKit.GraphRequest(graphPath: "me",
                                                       parameters: ["fields": "email , name"],
                                                       tokenString: token,
                                                       version: nil,
                                                       httpMethod: .get)
              
              request.start { connection, result, error in
                  print("\(result)")
              
              }
        
    }
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        return
        
    }
}
