//
//  LoginWebService.swift
//  DataApp
//
//  Created by Pallavi on 19/03/21.
//

import Foundation
class LoginWebService {
    // #MARK: - Store Variables 
    private var urlString: String
    private var session : URLSession
    
    init(_urlString: String, _urlsession:URLSession = .shared) {
        self.urlString = _urlString
        self.session = _urlsession
    }
    
    func Login(with fromModel:LoginRequestModel , ComplicationHandler:@escaping(LoginResponseModel?,LoginNetworkerror?)-> Void)
    {
        guard let url = URL(string: urlString) else{
            ComplicationHandler(nil,LoginNetworkerror.InvalidRequestUrl)
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody  = try? JSONEncoder().encode(fromModel)
        
        let dataTask =  session.dataTask(with: request) { data, response, error in
            
            if let requestError = error {
                ComplicationHandler(nil,LoginNetworkerror.failedRequest(discription:requestError.localizedDescription))
                return
            }
            if  let data = data , error == nil
            {
                let loginResponseModel = try? JSONDecoder().decode(LoginResponseModel.self, from: data)
                ComplicationHandler(loginResponseModel,nil)
            }else{
                ComplicationHandler(nil,LoginNetworkerror.LoginErrorforModel)
            }
        }
        dataTask.resume()
        
    }
}
