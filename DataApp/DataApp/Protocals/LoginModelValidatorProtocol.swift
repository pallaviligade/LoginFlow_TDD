//
//  LoginModelValidatorProtocol.swift
//  DataApp
//
//  Created by Pallavi on 28/03/21.
//

import Foundation

protocol LoginModelValidatorProtocol {
  
          func isFirstNameValid(firstName: String) -> Bool
          
          func isLastNameValid(lastName: String) -> Bool
          
          func isValidEmailFormat(email: String) -> Bool
          func isPasswordValid(password: String) -> Bool
          
          func doPasswordsMatch(password: String, repeatPassword: String) -> Bool
}
