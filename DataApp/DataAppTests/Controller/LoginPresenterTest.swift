//
//  LoginPresenterTest.swift
//  DataAppTests
//
//  Created by Pallavi on 23/03/21.
//

import XCTest

@testable import DataApp
class LoginPresenterTest: XCTestCase {
    var mockloginvalidator : MockLoginValidatorModel!
    var mockwebserviceProtocol : MockLoginWebServiceTest!
    var mockloginviewDelegate : MockLoginViewDelegateTest!
    var sut: LoginPresenter!
    var loginModel:LoginModel!
    
    override func setUpWithError() throws {
         loginModel = LoginModel(firstName: "Pallavi", lastName: "Ligade", email: "pallavi0204@gmail.com", password: "123",repeatPassword: "123")
         mockloginvalidator = MockLoginValidatorModel ()
         mockwebserviceProtocol = MockLoginWebServiceTest ()
         mockloginviewDelegate = MockLoginViewDelegateTest()
        
         sut = LoginPresenter(formModelValidator: mockloginvalidator, webservice: mockwebserviceProtocol, delegate: mockloginviewDelegate)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoginPresenter_WhenInformationgiven_WillValidateEachProperty()  {
        // Act
        sut.processUserLogin(formModel: loginModel)
        // Assert
        XCTAssertTrue(mockloginvalidator.isFirstNameValidator,"The first name was not validated")
        
    }
    func testSignupPresenter_WhenLoginOperationFails_ShouldCallErrorOnDelegate() {
        // Arrange
        let errorHandlerExpectation = expectation(description: "Expected the errorHandler() method to be called")
        mockloginviewDelegate.expectation = errorHandlerExpectation
        mockwebserviceProtocol.shouldReturnError = true
        
        // Act
        sut.processUserLogin(formModel: loginModel)
        self.wait(for: [errorHandlerExpectation], timeout: 5)

        // Assert
        XCTAssertEqual(mockloginviewDelegate.successfulSignupCounter, 0)
        XCTAssertEqual(mockloginviewDelegate.errorHandlerCounter, 1)
        XCTAssertNotNil(mockloginviewDelegate.signupError)
    }

}
