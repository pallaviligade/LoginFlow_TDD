//
//  MockUrlProtocal.swift
//  DataAppTests
//
//  Created by Pallavi on 20/03/21.
//

import Foundation
class MockUrlProtocal: URLProtocol {
    // We will Inject data from outside to use loading in protocals
    static var stubResponse:Data?
    static var error:Error?
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    override func startLoading() {
        if let loginerror = MockUrlProtocal.error {
            self.client?.urlProtocol(self, didFailWithError:loginerror)
        }else{
            self.client?.urlProtocol(self, didLoad:MockUrlProtocal.stubResponse ?? Data())
        }
        self.client?.urlProtocolDidFinishLoading(self)
    }
    override func stopLoading() {}
    
}
