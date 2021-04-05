//
//  LoginViewController.swift
//  DataApp
//
//  Created by Pallavi on 27/03/21.
//

import UIKit

class LoginViewController: UIViewController {
    var loginPresenterProtocl:LoginPresenterProtocal?
    
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var passwordTextFeild: UITextField!
    @IBOutlet weak var emailAddressTextfeild: UITextField!
    @IBOutlet weak var UserNametextfeild: UITextField!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        let loginModelValidator = LoginFromModelValidator ()
        let loginwebService = LoginWebService(_urlString: LoginConstants.signupURLString)
        
        if loginPresenterProtocl == nil{
            loginPresenterProtocl = LoginPresenter(formModelValidator: loginModelValidator, webservice: loginwebService, delegate: self)
        }
    }
    
    @IBAction func loginButtonTouchUpInside(_ sender: Any) {
        let loginmodel = LoginModel(firstName: UserNametextfeild.text!, lastName: "Ligade", email: emailAddressTextfeild.text!, password: passwordTextFeild.text!, repeatPassword: "1234")
        loginPresenterProtocl?.processUserLogin(formModel: loginmodel)
    }
 
}


extension LoginViewController : LoginViewDelegateProtocol {
    func successfullSignup() {
        
    }
    
    func errorHandler(error: LoginNetworkerror) {
        let alert = UIAlertController(title: "Error", message: "Your request can not be procces at this time", preferredStyle: .alert)
    
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        DispatchQueue.main.async {
            alert.view.accessibilityIdentifier = "errordialog"
            self.present(alert, animated: false, completion: nil)
        }
    }
    
    
}
