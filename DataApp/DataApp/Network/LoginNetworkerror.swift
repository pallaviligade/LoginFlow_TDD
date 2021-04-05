//
//  LoginNetworkerror.swift
//  DataApp
//
//  Created by Pallavi on 20/03/21.
//

import Foundation
enum LoginNetworkerror: LocalizedError, Equatable {
    case LoginErrorforModel
    case InvalidRequestUrl
    case failedRequest(discription:String)
    case InvalidFirstName
    case InvalidlastName
    case InvalidEmailID
    case InvalidPassword
    
    var errorDescription: String?{
        switch self {
            case .failedRequest(let discription):
                return discription
            case .InvalidRequestUrl,.LoginErrorforModel:
            return ""
            case .InvalidFirstName:
                return ""
            case .InvalidlastName:
                return ""
            case .InvalidEmailID:
            return ""
            case .InvalidPassword:
            return ""
        }
    }
}
