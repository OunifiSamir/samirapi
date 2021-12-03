//
//  facebookViewController.swift
//  doctor
//
//  Created by SAMIR OUNIFI on 27/11/2021.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class facebookViewController: UIViewController, LoginButtonDelegate {

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
