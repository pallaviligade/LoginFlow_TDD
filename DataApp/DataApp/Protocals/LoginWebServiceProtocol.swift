//
//  LoginWebServiceProtocol.swift
//  DataApp
//
//  Created by Pallavi on 28/03/21.
//

import Foundation
protocol LoginWebServiceProtocol : AnyObject{
    func Login(withForm formModel: LoginRequestModel, completionHandler: @escaping (LoginResponseModel?, LoginNetworkerror?) -> Void) 
}
