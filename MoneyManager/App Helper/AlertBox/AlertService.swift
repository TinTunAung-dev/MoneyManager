//
//  AlertService.swift
//
//  Created by Zin Lin Htet Naing on 9/24/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//


import Foundation
import UIKit

class AlertService {

    static let shared = AlertService()
    
    func alert(title: String, message: String, alertType: AlertType, completion: @escaping() ->(), failure: @escaping() ->()) -> AlertBoxView {
        
        let storyBoard = UIStoryboard(name: "AlertBoxScreen", bundle: .main)
        let alertBoxVC = storyBoard.instantiateViewController(withIdentifier: "AlertboxScreenId") as! AlertBoxView
        alertBoxVC.modalPresentationStyle = .overFullScreen
        
        alertBoxVC.alertTitle = title
        alertBoxVC.alertMessage = message
        
        alertBoxVC.okBtnAction = completion
        alertBoxVC.cancelBtnAction = failure
        
        switch alertType {
        case .simpleAlert:
            alertBoxVC.cancelBtnShowHide = true
            alertBoxVC.separateShowHide = true
            alertBoxVC.okBtnTitle = "OK"
        case .actionAlert:
            alertBoxVC.cancelBtnShowHide = false
            alertBoxVC.separateShowHide = false
            alertBoxVC.okBtnTitle = "Delete"
            alertBoxVC.cancelBtnTitle = "Cancel"
        case .forceActionAlert:
            alertBoxVC.cancelBtnShowHide = true
            alertBoxVC.separateShowHide = true
            alertBoxVC.okBtnTitle = "OK"
        }
        return alertBoxVC
    }
}

