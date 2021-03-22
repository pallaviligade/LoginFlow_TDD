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
    
    var errorDescription: String?{
        switch self {
            case .failedRequest(let discription):
                return discription
            case .InvalidRequestUrl,.LoginErrorforModel:
            return ""
        }
    }
}
