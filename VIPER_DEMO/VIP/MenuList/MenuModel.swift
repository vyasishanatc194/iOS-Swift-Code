//
//  MenuModel.swift
//  VIPER
//
//  Created by Govind Rakholiya on 23/07/18.
//  Copyright © 2018 tops. All rights reserved.
//
import UIKit
import Foundation
import AlamofireJsonToObjects

class countryData: EVNetworkingObject {
    var status = ""
    var data = [CountryList]()
}
class CountryList: EVNetworkingObject {
    var name = ""
    var code = ""
}

class checkModal:EVNetworkingObject {
    var PandeyG = ""
    var Hobbies = [Employees]()
}

class Employees: EVNetworkingObject {
    var userId = ""
    var jobTitleName = ""
    var firstName = ""
    var lastName = ""
    var preferredFullName = ""
    var employeeCode = ""
    var region = ""
    var phoneNumber = ""
    var emailAddress = ""
}
