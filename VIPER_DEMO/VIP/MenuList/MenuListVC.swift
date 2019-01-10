//
//  ViewController.swift
//  VIPER
//
//  Created by Govind Rakholiya on 23/07/18.
//  Copyright © 2018 tops. All rights reserved.
//

import UIKit


protocol MenuProtocol {
    func MenuListSucess(_ isSuccess : Bool, message : String)
}

extension MenuListVC: MenuProtocol {
    
    func MenuListSucess(_ isSuccess : Bool, message : String)  {
        
        if isSuccess
        {
            self.tblCountryList.delegate = self
            self.tblCountryList.dataSource = self
            self.tblCountryList.reloadData()
        }else{
            showAlert(message)
        }
    }
}

class MenuListVC: UIViewController {

    @IBOutlet weak var tblCountryList: UITableView!
    var presenter : MenuListPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpVIPER()

        self.presenter.getCountryApiCall(APIName: "http://www.mocky.io/v2/5b630c953000005a006502bf")
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setUpVIPER()
    {
        let presenter = MenuListPresenter()
        let interactor = MenuInteractor()
        
        self.presenter = presenter
        
        presenter.interactor = interactor
        presenter.MenuController = self
        interactor.presenter = presenter
    }

}


class  CountryCell: UITableViewCell {
    @IBOutlet weak var countryName: UILabel!
}

extension MenuListVC:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.country!.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CountryCell
        cell.countryName.text = self.presenter.country![indexPath.row].jobTitleName
        return cell
    }
}


