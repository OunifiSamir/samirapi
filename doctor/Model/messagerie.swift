//
//  messagerie.swift
//  doctor
//
//  Created by achref on 9/11/2021.
//

import Foundation


struct Messagerie : Decodable{
    let _id : String?
    let message : String?
    let object : String?
    let datecreation : String?
    let from : String?
    private  enum CodingKeys: String, CodingKey {
     
          case _id, message,object,datecreation,from
       }
    
}
