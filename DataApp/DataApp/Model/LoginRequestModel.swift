//
//  LoginRequestModel.swift
//  DataApp
//
//  Created by Pallavi on 19/03/21.
//

import Foundation
struct  LoginRequestModel : Encodable
{
    var firstName : String
    var lastName : String
    var userEmail : String
    var userPassword: String
}
