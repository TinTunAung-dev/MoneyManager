//
//  AddIncomeExpenseScreenModuleBuilder.swift
//  MoneyManager
//
//  Created Tin Tun Aung on 21/01/2020.
//  Copyright © 2020 Tin Tun Aung. All rights reserved.
//
//  Template generated by Tin Tun Aung
//

import UIKit
import Foundation

class AddIncomeExpenseScreenModuleBuilder {

    static func build() -> UIViewController {
        let storyboard = UIStoryboard.init(name: "AddIncomeExpenseScreen", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "AddIncomeExpenseScreenId") as! AddIncomeExpenseScreenView
        let interactor = AddIncomeExpenseScreenInteractor()
        let router = AddIncomeExpenseScreenRouter(view: view)
        let presenter = AddIncomeExpenseScreenPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        return view
    }

}
