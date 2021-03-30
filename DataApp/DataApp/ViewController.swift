//
//  ViewController.swift
//  DataApp
//
//  Created by Pallavi on 19/03/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let login = LoginWebService(_urlString: "http://appsdeveloperblog.com:8080/signup-mock-service/users")
        let loginRequestModel = LoginRequestModel(firstName:"Sergey", lastName:"Kargoplov", userEmail: "test@gmail.com", userPassword: "1234")

        login.Login(withForm: loginRequestModel) { loginRequestModel, error in
            
            print(loginRequestModel)
        }
    }


}

