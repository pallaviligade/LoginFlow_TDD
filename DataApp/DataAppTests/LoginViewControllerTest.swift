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
        let loginbutton : UIButton = try XCTUnwrap(sut.LoginButton,"Login button does not have any refrencing IBOUT")
        let loginbuttonAction = try XCTUnwrap (loginbutton.actions(forTarget: sut, forControlEvent: .touchUpInside),"Login button does not have any actions to assgined it")
        XCTAssertEqual(loginbuttonAction.count,1)
       // XCTAssertTrue(loginbuttonAction.contains("loginButtonTouchUpInside"),"There is no action loginButtonTouchUpInside to login button")
        XCTAssertEqual(loginbuttonAction.first, "loginButtonTouchUpInside:","There is no action loginButtonTouchUpInside to login button")
    }

}
