//
//  MockLoginWebServiceTest.swift
//  DataAppTests
//
//  Created by Pallavi on 28/03/21.
//

import Foundation
@testable import DataApp

class MockLoginWebServiceTest: LoginWebServiceProtocol {
    var isSignupMethodCalled: Bool = false
    var shouldReturnError: Bool = false
    func Login(withForm formModel: LoginRequestModel, completionHandler: @escaping (LoginResponseModel?, LoginNetworkerror?) -> Void) {
        isSignupMethodCalled = true
        
        if shouldReturnError {
            completionHandler(nil, LoginNetworkerror.failedRequest(discription: "Signup request was not successful"))
        } else {
            let responseModel = LoginResponseModel(status: "Ok")
            completionHandler(responseModel, nil)
        }
    }
    
    
}
