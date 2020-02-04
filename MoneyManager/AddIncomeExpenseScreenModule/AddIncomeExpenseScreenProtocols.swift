//
//  AddIncomeExpenseScreenProtocols.swift
//  MoneyManager
//
//  Created Tin Tun Aung on 21/01/2020.
//  Copyright © 2020 Tin Tun Aung. All rights reserved.
//
//  Template generated by Tin Tun Aung
//

import Foundation
import UIKit

//Presenter -> View
protocol AddIncomeExpenseScreenPresenterToViewProtocl: class {
    func initialControlSetup()
    func showDatePicker()
    func allTextfieldsAreEmpty()
    func categoryTextFieldIsEmpty()
    func dateTextfieldIsEmpty()
    func amountTextfieldIsEmpty()
    func noteTextfieldIsEmpty()
    func showAlertBox()
}

//View -> Presenter
protocol AddIncomeExpenseScreenViewToPresenterProtocol: class {
    var view: AddIncomeExpenseScreenPresenterToViewProtocl? {get set}
    var interactor: AddIncomeExpenseScreenPresentorToInterectorProtocol? {get set}
    func started()
    func clickDateButton()
    func clickCategoryButton()
    func clickSaveButton(type: String, category: String, date: String, amount: String, note: String)
}

//Interactor -> Presenter
protocol AddIncomeExpenseScreenInterectorToPresenterProtocol: class {
    func allTextfieldsAreEmpty()
    func categoryTextFieldIsEmpty()
    func dateTextfieldIsEmpty()
    func amountTextfieldIsEmpty()
    func noteTextfieldIsEmpty()
    func addSuccess()
}

//Presenter -> Interactor
protocol AddIncomeExpenseScreenPresentorToInterectorProtocol: class {
    var presenter: AddIncomeExpenseScreenInterectorToPresenterProtocol? {get set}
    func clickSaveButton(type: String, category: String, date: String, amount: String, note: String)
}

//Presenter -> Router or WireFrame
protocol AddIncomeExpenseScreenPresenterToRouterProtocol: class {
    func gotoSelectCategoryScreen(fromVC: UIViewController)
}


