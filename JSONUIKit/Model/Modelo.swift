//
//  Modelo.swift
//  JSONUIKit
//
//  Created by Jorge Maldonado Borbón on 03/02/21.
//

import Foundation

struct Modelo : Decodable {
    var data : [UserList]
}

struct User : Decodable{
    var data : UserList
}

struct UserList : Decodable {
    var id : Int
    var first_name : String
    var email : String
    var avatar : String
}
