//
//  HomeScreenProtocols.swift
//  MoneyManager
//
//  Created Tin Tun Aung on 20/01/2020.
//  Copyright © 2020 Tin Tun Aung. All rights reserved.
//
//  Template generated by Tin Tun Aung
//

import Foundation
import UIKit

//Presenter -> View
protocol HomeScreenPresenterToViewProtocl: class {
    func initialControlSetup()
    func showDatePicker()
    func passData(_ income: Double, _ expense: Double, savings: Double)
}

//View -> Presenter
protocol HomeScreenViewToPresenterProtocol: class {
    var view: HomeScreenPresenterToViewProtocl? {get set}
    var interactor: HomeScreenPresentorToInterectorProtocol? {get set}
    func started()
    func clickDateButton()
    func clickViews(screenName: String)
    func getData(_ date: String)
}

//Interactor -> Presenter
protocol HomeScreenInterectorToPresenterProtocol: class {
    func passData(_ income: Double, _ expense: Double, savings: Double)
}

//Presenter -> Interactor
protocol HomeScreenPresentorToInterectorProtocol: class {
    var presenter: HomeScreenInterectorToPresenterProtocol? {get set}
    func getData(_ date: String)
}

//Presenter -> Router or WireFrame
protocol HomeScreenPresenterToRouterProtocol: class {
    func checkAndPushScreen(fromVC: UIViewController, screenName: String)
    func goNextScreen(fromVC: UIViewController, toVC: UIViewController)
}


