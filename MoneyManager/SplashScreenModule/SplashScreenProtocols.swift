//
//  SplashScreenProtocols.swift
//  MoneyManager
//
//  Created Tin Tun Aung on 28/01/2020.
//  Copyright © 2020 Tin Tun Aung. All rights reserved.
//
//  Template generated by Tin Tun Aung
//

import Foundation
import UIKit

//Presenter -> View
protocol SplashScreenPresenterToViewProtocl: class {
    func initialControlSetup()
}

//View -> Presenter
protocol SplashScreenViewToPresenterProtocol: class {
    var view: SplashScreenPresenterToViewProtocl? {get set}
    var interactor: SplashScreenPresentorToInterectorProtocol? {get set}
    func started()
    func gotoNextScreen()
}

//Interactor -> Presenter
protocol SplashScreenInterectorToPresenterProtocol: class {

}

//Presenter -> Interactor
protocol SplashScreenPresentorToInterectorProtocol: class {
    var presenter: SplashScreenInterectorToPresenterProtocol? {get set}
}

//Presenter -> Router or WireFrame
protocol SplashScreenPresenterToRouterProtocol: class {
    func gotoNextScreen(fromVC: UIViewController)
}
