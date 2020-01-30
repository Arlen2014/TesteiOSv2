//
//  LoginInteractor.swift
//  TesteiOSv2_ArlenPereira
//
//  Created by Arlen Ricardo Pereira on 28/01/20.
//  Copyright (c) 2020 Arlen Ricardo Pereira. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LoginBusinessLogic
{
    func loginRequest(request: LoginModel.LoginRequestModel.Request)
    func validationLoginRequest(request: LoginModel.ValidationLoginModel.Request)
}

protocol LoginDataStore {
    var userInfo: LoginAPIModel? { get set }
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore
{
    var userInfo: LoginAPIModel?
    
    var presenter: LoginPresentationLogic?
    var worker = ServiceWorkers(serviceStore: ServiceRestAPI())
  
    // MARK: Function
  
    func loginRequest(request: LoginModel.LoginRequestModel.Request)
    {
        worker.loginRequest(username: request.username, password: request.password) { (loginResponse) -> Void in
            self.userInfo = loginResponse
            let response = LoginModel.LoginRequestModel.Response(loginResponse: loginResponse)
        
            self.presenter?.presentLogin(response: response)
        }
    }
    
    func validationLoginRequest(request: LoginModel.ValidationLoginModel.Request) {
        
        let response = LoginModel.ValidationLoginModel.Response(username: request.username, password: request.password)
        self.presenter?.presentValidationLogin(response: response)
    }
}
