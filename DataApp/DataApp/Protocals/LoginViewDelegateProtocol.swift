//
//  LoginViewDelegateProtocol.swift
//  DataApp
//
//  Created by Pallavi on 28/03/21.
//

import Foundation
protocol LoginViewDelegateProtocol : AnyObject {
    func successfullSignup()
    func errorHandler(error: LoginNetworkerror)
}
