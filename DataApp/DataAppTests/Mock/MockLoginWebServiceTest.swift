//
//  MockLoginWebServiceTest.swift
//  DataAppTests
//
//  Created by Pallavi on 28/03/21.
//

import Foundation
@testable import DataApp

class MockLoginWebServiceTest: LoginWebServiceProtocol {
    func Login(withForm formModel: LoginRequestModel, completionHandler: @escaping (LoginResponseModel?, LoginNetworkerror?) -> Void) {
        
    }
    
    
}
