//
//  DataAppUITests.swift
//  DataAppUITests
//
//  Created by Pallavi on 19/03/21.
//

import XCTest
@testable import DataApp
class LoginFlowUITests: XCTestCase {
  private  var app : XCUIApplication!
    private var firstname : XCUIElement!
    private var email : XCUIElement!
    private  var password : XCUIElement!
    private var  button:XCUIElement!
    override func setUpWithError() throws {
      
       try super.setUpWithError()
       app = XCUIApplication()
        app.launch()
        
         firstname = app.textFields["UserName"]
         email = app.textFields["EmailID"]
         password = app.textFields["Password"]
         button = app.buttons["LoginButton"]
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app = nil
        firstname = nil
        email = nil
        password = nil
      try  super.tearDownWithError()
    }

    func testLoginViewController_WhenViewloaded_ThencheckedelementsInEnabled() throws {
        // UI tests must launch the application that they test.
        XCTAssertTrue(firstname.isEnabled,"The firstname of textFeible is not Enable for UserInteraction")
        XCTAssertTrue(email.isEnabled,"The email of textFeible is not Enable for UserInteraction")
        XCTAssertTrue(password.isEnabled,"The password of textFeible is not Enable for UserInteraction")

                
    }
    func  testViewController_WhenValidDataNotSubmitted_ThenDisplayError(){
       
        // Arrange
        firstname.tap()
        firstname.typeText("Pallavi")
        
        email.tap()
        email.typeText("pallavi0204_gmail.com")
        
        password.tap()
        password.typeText("x")
        
        // Act
        button.tap()
        
        let emailIDAttachScreen = email.screenshot()
        let emailIDattachement = XCTAttachment(screenshot: emailIDAttachScreen)
        emailIDattachement.name = "Screen shot of email textfeild"
        emailIDattachement.lifetime = .keepAlways
        add(emailIDattachement)
        
        //let currentAppWindow = app.screenshot() // this will generte full screen shot
        let currentAppWindow = XCUIScreen.main.screenshot()// this will generte full screen shot // this will generte full screen shot 
        let currentAppWindowachement = XCTAttachment(screenshot: currentAppWindow)
        currentAppWindowachement.name = "Login page"
        currentAppWindowachement.lifetime = .keepAlways
        add(currentAppWindowachement)
        
        
        // Assert
        XCTAssertTrue(app.alerts["errordialog"].waitForExistence(timeout: 1),"Error dialog was not  presented when Invalid data presented")
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
                
            }
        }
    }
}
