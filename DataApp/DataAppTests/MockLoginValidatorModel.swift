//
//  MockLoginValidatorModel.swift
//  DataAppTests
//
//  Created by Pallavi on 23/03/21.
//

import Foundation
@testable import DataApp
class MockLoginValidatorModel: LoginModelValidatorProtocol{
    var isFirstNameValidator:Bool = false
    var isLastNameValidated: Bool = false
    var isEmailFormatValidated: Bool = false
    var isPasswordValidated: Bool = false
    func isFirstNameValid(firstName: String) -> Bool {
        isFirstNameValidator = true
        return isFirstNameValidator
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        isLastNameValidated = true
        return isLastNameValidated
    }
    
    func isValidEmailFormat(email: String) -> Bool {
        isEmailFormatValidated = true
        return isEmailFormatValidated
    }
    
    func isPasswordValid(password: String) -> Bool {
        isPasswordValidated = true
        return isPasswordValidated
    }
    
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool {
        isFirstNameValidator = true
        return isFirstNameValidator
    }
    
}
