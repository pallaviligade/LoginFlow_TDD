//
//  LoginPresenter.swift
//  DataApp
//
//  Created by Pallavi on 23/03/21.
//

import Foundation
class LoginPresenter: LoginPresenterProtocal {
   
    
    
   private  var formModelValidator : LoginModelValidatorProtocol
   private  var webservice: LoginWebServiceProtocol
    private weak var delegate: LoginViewDelegateProtocol?
  
  required  init(formModelValidator: LoginModelValidatorProtocol, webservice: LoginWebServiceProtocol,
        delegate: LoginViewDelegateProtocol) {
       self.formModelValidator = formModelValidator
       self.webservice = webservice
       self.delegate = delegate
   }
    func processUserLogin(formModel: LoginModel) {
        
        if !formModelValidator.isFirstNameValid(firstName: formModel.firstName) {
            delegate?.errorHandler(error: LoginNetworkerror.InvalidFirstName)
            return
        }
        
        if !formModelValidator.isLastNameValid(lastName: formModel.lastName) {
            delegate?.errorHandler(error: LoginNetworkerror.InvalidlastName)
            return
        }
        
        if !formModelValidator.isValidEmailFormat(email: formModel.email) {
            delegate?.errorHandler(error: LoginNetworkerror.InvalidEmailID)
            return
        }
        
        if !formModelValidator.isPasswordValid(password: formModel.password) {
            delegate?.errorHandler(error: LoginNetworkerror.InvalidEmailID)
            return
        }
        
        if !formModelValidator.doPasswordsMatch(password: formModel.password, repeatPassword: formModel.repeatPassword) {
            return
        }
        


   let requestModel = LoginRequestModel(firstName:formModel.firstName, lastName:formModel.lastName, userEmail: formModel.email, userPassword: formModel.password)
        webservice.Login(withForm: requestModel, completionHandler: { [weak self] (responseModel, error) in
            if let error = error {
                self?.delegate?.errorHandler(error: error)
                return
            }

            if let _ = responseModel {
                self?.delegate?.successfullSignup()
            }
        })

   }
}
