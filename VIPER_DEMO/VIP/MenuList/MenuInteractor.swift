//
//  MenuListInteractor.swift
//  VIPER
//
//  Created by Govind Rakholiya on 23/07/18.
//  Copyright © 2018 tops. All rights reserved.
//

import Foundation
import Alamofire
import UIKit
import SVProgressHUD

protocol MenuListInteractorProtocol
{
    func getCountryList(strAPIPath:String)
}

class MenuInteractor : MenuListInteractorProtocol
{
    
    var presenter : MenuListPresenterProtocol!

    
    func getCountryList(strAPIPath:String) {
        
        SVProgressHUD.show()

        Alamofire.request(strAPIPath,method:.get , parameters: nil, headers: nil)
            .responseObject { (response: DataResponse<checkModal>) in

                SVProgressHUD.dismiss()

                if response.result.value != nil {
                    let responseValue = response.result.value

                    if responseValue?.PandeyG == "K" {
//                        let userDict = responseValue!.toJsonData()
//                        setUserDefault(ObjectToSave: userDict as AnyObject, KeyToSave: kBaseURL)
                        self.presenter.userListAPISuccess(userData: (responseValue?.Hobbies)!)

                    }else{
                        self.presenter.userListAPIFailure(message: (responseValue?.PandeyG)!)
                    }
                }
            }
            .responseJSON { response in
                switch response.result {
                case .success:
                    break
                case .failure( _):
                    break
                }
        }
    }
    
}


