//
//  event.swift
//  doctor
//
//  Created by achref on 9/11/2021.
//

import Foundation


struct Event : Decodable {
    let _id : String?
    let name : String?
    let description : String?
    let money : String?
    let moneyreached : String?
    let datefin : String?
  
    private  enum CodingKeys: String, CodingKey {
     
          case _id, name,description,money,moneyreached,datefin
       }
}
