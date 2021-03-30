//
//  MockLoginViewDelegateTest.swift
//  DataAppTests
//
//  Created by Pallavi on 28/03/21.
//

import Foundation
import XCTest
@testable import DataApp

class MockLoginViewDelegateTest: LoginViewDelegateProtocol {
    var expectation: XCTestExpectation?
    var successfulSignupCounter = 0
    var errorHandlerCounter = 0
    var signupError: LoginNetworkerror?
    
    func successfullSignup() {
        successfulSignupCounter += 1
        expectation?.fulfill()
    }
    
    func errorHandler(error: LoginNetworkerror) {
        signupError = error
        errorHandlerCounter += 1
        expectation?.fulfill()
    }
    
    
}
