//
//  MenuListPresenter.swift
//  VIPER
//
//  Created by Govind Rakholiya on 23/07/18.
//  Copyright © 2018 tops. All rights reserved.
//

import Foundation

//http://www.mocky.io/v2/5b5acb0f3100002d119a88c4

protocol MenuListPresenterProtocol
{
    var country:[Employees]? {get}
    func getCountryApiCall(APIName:String)
    func userListAPISuccess(userData : [Employees])
    func userListAPIFailure(message : String)
}

class MenuListPresenter: MenuListPresenterProtocol {
    var country: [Employees]?
    var MenuController : MenuProtocol!
    var interactor : MenuListInteractorProtocol!

    
    func getCountryApiCall(APIName:String) {
        self.interactor.getCountryList(strAPIPath: APIName)
    }
    
    func userListAPISuccess(userData : [Employees])
    {
        self.country = userData
        self.MenuController.MenuListSucess(true, message: "")
    }
    
    func userListAPIFailure(message: String)
    {
        self.MenuController.MenuListSucess(false, message: message)
    }
}
