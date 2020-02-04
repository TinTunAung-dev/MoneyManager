//
//  HomeScreenRouter.swift
//  MoneyManager
//
//  Created Tin Tun Aung on 20/01/2020.
//  Copyright © 2020 Tin Tun Aung. All rights reserved.
//
//  Template generated by Tin Tun Aung
//

import UIKit
import Foundation

class HomeScreenRouter {

    var viewController: UIViewController
    init(view: UIViewController) {
        self.viewController = view
    }

}

// MARK: - Presenter to Wireframe Interface
extension HomeScreenRouter: HomeScreenPresenterToRouterProtocol {
    
    func checkAndPushScreen(fromVC: UIViewController, screenName: String) {
        switch screenName {
        case ScreenName.addIncome, ScreenName.addExpense:
            let addIncomeExpense = AddIncomeExpenseScreenModuleBuilder.build()
            goNextScreen(fromVC: fromVC, toVC: addIncomeExpense)
        case ScreenName.showTransactions:
            let showTransactions = TransactionScreenModuleBuilder.build()
            goNextScreen(fromVC: fromVC, toVC: showTransactions)
        default:
            break
        }
    }
    
    func goNextScreen(fromVC: UIViewController, toVC: UIViewController) {
        fromVC.navigationController?.pushViewController(toVC, animated: true)
    }
}