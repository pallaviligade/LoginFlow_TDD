//
//  LoginPresenterProtocal.swift
//  DataApp
//
//  Created by Pallavi on 28/03/21.
//

import Foundation
protocol LoginPresenterProtocal : AnyObject {
    init(formModelValidator:LoginModelValidatorProtocol, webservice: LoginWebServiceProtocol,
    delegate: LoginViewDelegateProtocol)
    func processUserLogin(formModel: LoginModel)
}
