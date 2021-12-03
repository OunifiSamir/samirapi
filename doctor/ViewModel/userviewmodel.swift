//
//  userviewmodel.swift
//  doctor
//
//  Created by achref on 19/11/2021.
//

import Foundation
extension String {
    func toJSON() -> Any? {
        guard let data = self.data(using: .utf8, allowLossyConversion: false) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    }
}
class userVM {
  
    var userdata = [User]()
    var tokenString : String?

    var userToken : User?
    var userByemail : User?
    @Published var isAuthenticated : Bool = false
    func getallusers(){
       
        
        let jsonUrlString = "http://localhost:3000/allusers"
            guard let url = URL(string: jsonUrlString) else
            { return }

            URLSession.shared.dataTask(with: url) { (data, response, err) in

                guard let data =  data else{ return }

                do {

                    let Allusers = try JSONDecoder().decode([User].self, from: data)
                   
                    Allusers.forEach { user in self.userdata.append(user) }
                
                    
         
                } catch let jsonErr {
                    print("Error serializing json:", jsonErr)
                }

            }.resume()
      

       
    }
    func getuserfromtoken(token : String){
       
        print("Token : ----------------------")
        print(token)
        let jsonUrlString = "http://localhost:3000/tokenaccount"
            guard let url = URL(string: jsonUrlString) else
            { return }
        var request = URLRequest(url: url)
             request.addValue(token, forHTTPHeaderField: "authorization")
            URLSession.shared.dataTask(with: request) { (data, response, err) in
              
                guard let data =  data else{ return }

                do {

                    let Allusers = try JSONDecoder().decode(User.self, from: data)
                   
                   
                    DispatchQueue.main.async {
                        self.userToken = Allusers
                    }
                    print("name = " + Allusers.nom!)
                    print("email = " + Allusers.email!)
                    print("phone = " + Allusers.phone!)
                   
         
                } catch let jsonErr {
                    print("Error serializing json:", jsonErr)
                }

            }.resume()
      

       
    }
    
    func createtoken(email:String,password:String){
        let defaults = UserDefaults.standard
            var request = URLRequest(url: URL(string: "http://localhost:3000/loginClient")!)
            request.httpMethod = "post"
            request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
            print("its working")
            let postString = "email="+email+"&"+"password="+password+"&"
            request.httpBody = postString.data(using: .utf8)
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {                                                 // check for fundamental networking error
                    print("error=\(String(describing: error?.localizedDescription))")
                    return
                }

                if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                    print("statusCode should be 200, but is \(httpStatus.statusCode)")
                    print("response = \(String(describing: response))")
                }

                let responseString = String(data: data, encoding: .utf8)
               

                let json = responseString!.toJSON() as? [String:AnyObject]
               
                self.tokenString = json!["token"] as? String
                defaults.setValue(self.tokenString, forKey: "jsonwebtoken")
                DispatchQueue.main.async {
                    self.isAuthenticated = true
                    print(self.isAuthenticated)
                }
             
                self.getuserfromtoken(token:(json!["token"] as? String)!)
                if(responseString?.contains("true"))!{
                    print("status = true")
                }
                else{
                    print("Status = false")
                }
            }

            task.resume()
        }
    
    func signout() {
               
               let defaults = UserDefaults.standard
               defaults.removeObject(forKey: "jsonwebtoken")
               DispatchQueue.main.async {
                   self.isAuthenticated = false
                   print(self.isAuthenticated)
               }
               
           }
   
    func createuser(nom : String,prenom:String,email:String,password:String,phone:String,categorieclient:String){
            var request = URLRequest(url: URL(string: "http://localhost:3000/createuser")!)
            request.httpMethod = "post"
            request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
            print("its working")
            let postString = "nom="+nom+"&"+"prenom="+prenom+"&"+"email="+email+"&"+"password="+password+"&"+"phone="+phone+"&"+"categorieclient="+categorieclient+"&"
            request.httpBody = postString.data(using: .utf8)
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {                                                 // check for fundamental networking error
                    print("error=\(String(describing: error?.localizedDescription))")
                    return
                }

                if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                    print("statusCode should be 200, but is \(httpStatus.statusCode)")
                    print("response = \(String(describing: response))")
                }

                let responseString = String(data: data, encoding: .utf8)
                print("responseString = \(String(describing: responseString))")

                if(responseString?.contains("true"))!{
                    print("status = true")
                }
                else{
                    print("Status = false")
                }
            }

            task.resume()
        }
    
    
    func updateuser(id:String,nom : String,prenom:String,email:String,password:String,phone:String,categorieclient:String){
         var request = URLRequest(url: URL(string: "http://localhost:3000/updateuser/"+id)!)
             request.httpMethod = "put"
             request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
             print("its working")
         let postString = "nom="+nom+"&"+"prenom="+prenom+"&"+"email="+email+"&"+"password="+password+"&"+"phone="+phone+"&"+"categorieclient="+categorieclient+"&"
             request.httpBody = postString.data(using: .utf8)
             let task = URLSession.shared.dataTask(with: request) { data, response, error in
                 guard let data = data, error == nil else {                                                 // check for fundamental networking error
                     print("error=\(String(describing: error?.localizedDescription))")
                     return
                 }

                 if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                     print("statusCode should be 200, but is \(httpStatus.statusCode)")
                     print("response = \(String(describing: response))")
                 }

                 let responseString = String(data: data, encoding: .utf8)
                 print("responseString = \(String(describing: responseString))")

                 if(responseString?.contains("true"))!{
                     print("status = true")
                 }
                 else{
                     print("Status = false")
                 }
             }

             task.resume()
         }
    
    func deleteuser(id:String){
        var request = URLRequest(url: URL(string: "http://localhost:3000/deleteuser/"+id)!)
            request.httpMethod = "delete"
            request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
            print("its working")
            let postString =    "nom=tirari&" +
            "prenom=tirari&" +
            "email=tirari@abc.vom&" +
            "password=tirari&" +
            "phone=tirari&" +
            "categorieclient=tirari&"
            request.httpBody = postString.data(using: .utf8)
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {                                                 // check for fundamental networking error
                    print("error=\(String(describing: error?.localizedDescription))")
                    return
                }

                if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                    print("statusCode should be 200, but is \(httpStatus.statusCode)")
                    print("response = \(String(describing: response))")
                }

                let responseString = String(data: data, encoding: .utf8)
                print("responseString = \(String(describing: responseString))")

                if(responseString?.contains("true"))!{
                    print("status = true")
                }
                else{
                    print("Status = false")
                }
            }

            task.resume()
        }
    
    func getbyemail(email : String){
       
        
        let jsonUrlString = "http://localhost:3000/getuserEmail/"+email
            guard let url = URL(string: jsonUrlString) else
            { return }

            URLSession.shared.dataTask(with: url) { (data, response, err) in

                guard let data =  data else{ return }

                do {

                    let Allusers = try JSONDecoder().decode([User].self, from: data)
                   
                    Allusers.forEach { user in self.userByemail = user }
                
                    
         
                } catch let jsonErr {
                    print("Error serializing json:", jsonErr)
                }

            }.resume()
      

       
    }
}
