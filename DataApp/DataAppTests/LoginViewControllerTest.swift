//
//  LoginViewControllerTest.swift
//  DataAppTests
//
//  Created by Pallavi on 27/03/21.
//

import XCTest
@testable import DataApp
class LoginViewControllerTest: XCTestCase {

    var storyboard : UIStoryboard!
    var sut : LoginViewController!
    
    override func setUpWithError() throws {
        storyboard = UIStoryboard(name: "Main", bundle: nil)
         sut = storyboard.instantiateViewController(withIdentifier: "LoginViewControllerID") as? LoginViewController
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
         storyboard = nil
         sut = nil
    }

    func testLoginViewcontroller_WhenCreated_hasTestFeildIsEmpty() throws
    {
       let userNametextfeild = try XCTUnwrap(sut.UserNametextfeild,"The connection of textefild outlet is not connected")
        let emailAddressTextfeild = try XCTUnwrap(sut.emailAddressTextfeild,"The connection of textefild outlet is not connected")
        let passwordTextFeild = try XCTUnwrap(sut.passwordTextFeild,"The connection of textefild outlet is not connected")
        XCTAssertEqual(userNametextfeild.text, "","The user name of textfeild was not empty when view is loaded")
        XCTAssertEqual(emailAddressTextfeild.text, "","The email  of textfeild was not empty when view is loaded")
        XCTAssertEqual(passwordTextFeild.text, "","The password of textfeild was not empty when view is loaded")
    }
    func testViewController_WhenLoginbuttonTouched_Action() throws {
       // Arrange
        let loginbutton : UIButton = try XCTUnwrap(sut.LoginButton,"Login button does not have any refrencing IBOUT")
     // Act
        let loginbuttonAction = try XCTUnwrap (loginbutton.actions(forTarget: sut, forControlEvent: .touchUpInside),"Login button does not have any actions to assgined it")
        // Assert
        XCTAssertEqual(loginbuttonAction.count,1)
       // XCTAssertTrue(loginbuttonAction.contains("loginButtonTouchUpInside"),"There is no action loginButtonTouchUpInside to login button")
        XCTAssertEqual(loginbuttonAction.first, "loginButtonTouchUpInside:","There is no action loginButtonTouchUpInside to login button")
    }
    func testViewController_WhenLoginbuttonTapped_InvokeLoginProcess()  {
        // Arrange
        let mockloginvalidator = MockLoginValidatorModel ()
        let mockwebserviceProtocol = MockLoginWebServiceTest ()
        let mockloginviewDelegate = MockLoginViewDelegateTest()
        
        let mockloginPresent = MockLoginPresenter(formModelValidator: mockloginvalidator, webservice: mockwebserviceProtocol, delegate: mockloginviewDelegate)
        // Act
        sut.loginPresenterProtocl = mockloginPresent
        sut.LoginButton.sendActions(for: .touchUpInside)
        // Assert
        XCTAssertTrue(mockloginPresent.processUserLoginCalled, "The process was mot called on presenter object when login button was tapped")
    }

}
