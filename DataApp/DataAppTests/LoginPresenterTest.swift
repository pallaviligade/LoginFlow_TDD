//
//  LoginPresenterTest.swift
//  DataAppTests
//
//  Created by Pallavi on 23/03/21.
//

import XCTest

@testable import DataApp
class LoginPresenterTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoginPresenter_WhenInformationgiven_WillValidateEachProperty()  {
        // Arrange
        let loginModel = LoginRequestModel(firstName: "Pallavi", lastName: "Ligade", userEmail: "pallavi0204@gmail.com", userPassword: "123")
        
        let mockvalidator = MockLoginValidatorModel()
        let sut = LoginPresenter()
        
        // Act
        sut.processUser(from: loginModel)
        
        // Assert
        
        XCTAssertTrue(mockvalidator.isFirstNameValidator)
        
    }

}
