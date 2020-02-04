//
//  SelectCategoryScreenProtocols.swift
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
protocol SelectCategoryScreenPresenterToViewProtocl: class {
    func initialControlSetup()
    func passData(categories: [String])
}

//View -> Presenter
protocol SelectCategoryScreenViewToPresenterProtocol: class {
    var view: SelectCategoryScreenPresenterToViewProtocl? {get set}
    var interactor: SelectCategoryScreenPresentorToInterectorProtocol? {get set}
    func started()
    func getData()
}

//Interactor -> Presenter
protocol SelectCategoryScreenInterectorToPresenterProtocol: class {
    func passData(categories: [String])
}

//Presenter -> Interactor
protocol SelectCategoryScreenPresentorToInterectorProtocol: class {
    var presenter: SelectCategoryScreenInterectorToPresenterProtocol? {get set}
    func getData()
}

//Presenter -> Router or WireFrame
protocol SelectCategoryScreenPresenterToRouterProtocol: class {
    func gotoNextScreen(fromVC: UIViewController)
}


