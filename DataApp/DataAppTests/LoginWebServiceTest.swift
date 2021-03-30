//
//  LoginWebServiceTest.swift
//  DataAppTests
//
//  Created by Pallavi on 19/03/21.
//

import XCTest
@testable import DataApp
class LoginWebServiceTest: XCTestCase {

    var sut : LoginWebService!
    var loginRequestModel: LoginRequestModel!
    
    override func setUpWithError() throws {
        //ephemeral Does not use perstiant stroage caches, cookies
        let sessionConfiguration = URLSessionConfiguration.ephemeral
        sessionConfiguration.protocolClasses = [MockUrlProtocal.self]
        let session = URLSession(configuration: sessionConfiguration)
        // sut = system under test
         sut = LoginWebService(_urlString:ApiConstantsPoints.LoginApi,
                                  _urlsession: session)
        loginRequestModel = LoginRequestModel(firstName:"Pallavi", lastName:"Ligade", userEmail: "pallavi0204@gmail.com", userPassword: "1234")
    }

    override func tearDownWithError() throws {
        sut = nil
        loginRequestModel = nil
        MockUrlProtocal.stubResponse = nil
        
    }

    func testLoginWebService_WhenGivenSucessfullResponse_ReturnSucess()  {
        // Arranage
        let jsonData = "{\"status\": \"ok\"}"
        MockUrlProtocal.stubResponse = jsonData.data(using: .utf8)
        let expention = self.expectation(description: "Login response expectation")
        // Act
        sut.Login(withForm: loginRequestModel) { loginResponseModel, error in
            XCTAssertEqual(loginResponseModel?.status, "ok")
            expention.fulfill()
        }
       wait(for: [expention], timeout: 5)
    }
    
    func testLoginWebService_WhenRecviedJSON_ErrorOccuered() {
        // Arranage
        let jsonData = "{\"path\": \"/users\",\"error\":\"Internal server error\"}"
        MockUrlProtocal.stubResponse = jsonData.data(using: .utf8)
        let expention = self.expectation(description: "Login response contanins differnt json")
        // Act
        sut.Login(withForm: loginRequestModel) { loginResponseModel, error in
            XCTAssertNil(loginResponseModel)//,"Login response Model contains unknow json it should have nil")
            XCTAssertEqual(error,LoginNetworkerror.LoginErrorforModel,"does not match Return error")
            expention.fulfill()
        }
       wait(for: [expention], timeout: 5)
    }
    func testLoginWebService_WhenRecviedURL_Empty()  {
        // Arrange
        sut = LoginWebService(_urlString: "")
           let expectation = self.expectation(description: "An Empty url string expectation")
        //Act
        
        sut.Login(withForm:loginRequestModel) { loginResponseModel, error in
            //Assert
            XCTAssertEqual(error, LoginNetworkerror.InvalidRequestUrl)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
       
    }
    
    func testLoginWebService_WhenURLRequestFailed_ErrorMessageDiscription()  {
        // Arrange
        let expextions = self.expectation(description: "Failed Request Expextation")
        let errorDescription = "A localized description of an error"
        MockUrlProtocal.error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: errorDescription])//LoginNetworkerror.failedRequest(discription:errorDescription)
        // Act
        sut.Login(withForm: loginRequestModel) { responseModel, error in
            //Assert
            
            XCTAssertEqual(error, LoginNetworkerror.failedRequest(discription:errorDescription))
            expextions.fulfill()
        }
        
        wait(for: [expextions], timeout: 3)
    }

}
