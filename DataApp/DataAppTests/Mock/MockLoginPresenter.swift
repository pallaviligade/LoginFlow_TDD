//
//  MockLoginPresenter.swift
//  DataAppTests
//
//  Created by Pallavi on 28/03/21.
//

import Foundation
@testable import DataApp
class MockLoginPresenter : LoginPresenterProtocal{
  
    var processUserLoginCalled:Bool = false
    required init(formModelValidator: LoginModelValidatorProtocol, webservice: LoginWebServiceProtocol, delegate: LoginViewDelegateProtocol) {
        
    }
    
    func processUserLogin(formModel: LoginModel) {
        processUserLoginCalled = true
    }
    
   
}
