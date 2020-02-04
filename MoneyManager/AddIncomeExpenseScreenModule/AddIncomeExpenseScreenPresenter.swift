//
//  AddIncomeExpenseScreenPresenter.swift
//  MoneyManager
//
//  Created Tin Tun Aung on 21/01/2020.
//  Copyright © 2020 Tin Tun Aung. All rights reserved.
//
//  Template generated by Tin Tun Aung
//

import Foundation
import UIKit

class AddIncomeExpenseScreenPresenter: AddIncomeExpenseScreenViewToPresenterProtocol {
    
    var view: AddIncomeExpenseScreenPresenterToViewProtocl?
    var router: AddIncomeExpenseScreenPresenterToRouterProtocol?
    var interactor: AddIncomeExpenseScreenPresentorToInterectorProtocol?

    init(view: AddIncomeExpenseScreenPresenterToViewProtocl, interactor: AddIncomeExpenseScreenPresentorToInterectorProtocol, router: AddIncomeExpenseScreenPresenterToRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func started() {
        view?.initialControlSetup()
    }

    func clickDateButton() {
        view?.showDatePicker()
    }
    
    func clickCategoryButton() {
        if let fromVC = self.view as? UIViewController {
            self.router?.gotoSelectCategoryScreen(fromVC: fromVC)
        }
    }
    
    func clickSaveButton(type: String, category: String, date: String, amount: String, note: String) {
        interactor?.clickSaveButton(type: type, category: category, date: date, amount: amount, note: note)
    }
}

// MARK: - Interactor to Presenter
extension AddIncomeExpenseScreenPresenter: AddIncomeExpenseScreenInterectorToPresenterProtocol {
    func addSuccess() {
        view?.showAlertBox()
    }
    
    func allTextfieldsAreEmpty() {
        view?.allTextfieldsAreEmpty()
    }
    
    func categoryTextFieldIsEmpty() {
        view?.categoryTextFieldIsEmpty()
    }
    
    func dateTextfieldIsEmpty() {
        view?.dateTextfieldIsEmpty()
    }
    
    func amountTextfieldIsEmpty() {
        view?.dateTextfieldIsEmpty()
    }
    
    func noteTextfieldIsEmpty() {
        view?.noteTextfieldIsEmpty()
    }
}
