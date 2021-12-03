//
//  question.swift
//  doctor
//
//  Created by achref on 9/11/2021.
//

import Foundation



struct Question : Decodable{
    
    let _id : String?
    let description : String?
    let datecreation : String?
    
    private  enum CodingKeys: String, CodingKey {
     
          case _id, description,datecreation
       }
      
   
   
}
