//
//  Constants.swift
//
//  Created by Govind Rakholiya on 28/05/18.
//  Copyright © 2018 tops. All rights reserved.

import UIKit

let appDelegate = UIApplication.shared.delegate as! AppDelegate

enum popUpMessage : String {
    case someWrong          = "No internet connection. Make sure that the Wifi or cellular mobile data  is turned on, then try again"
    case serverError          = "Currently unable to reach server, Try after some time."
}
func showAlert(_ message: String, position: HRToastPosition = HRToastPosition.Default)
{
    if message.count > 0 {
        DispatchQueue.main.async(execute: {
            appDelegate.window!.makeToast(message: message , duration: 2, position: position)
        })
    }
}

func setUserDefault(ObjectToSave : AnyObject?  , KeyToSave : String){
    let defaults = UserDefaults.standard
    if (ObjectToSave != nil){
        defaults.set(ObjectToSave!, forKey: KeyToSave)
    }
    UserDefaults.standard.synchronize()
}
