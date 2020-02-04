//
//  Extensions.swift
//  MoneyManager
//
//  Created by Tin Tun Aung on 20/01/2020.
//  Copyright © 2020 Tin Tun Aung. All rights reserved.
//

import Foundation
import UIKit

var currentDate = Date()

extension UITextField {
  func addButton(button: UIButton, image: UIImage) {
     let view = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
     view.backgroundColor = .clear
     button.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
     button.setImage(image, for: .normal)
     button.imageView?.clipsToBounds = true
     button.clipsToBounds = true
     button.center = view.center
     view.addSubview(button)
     self.rightViewMode = .always
     self.rightView = view
}

func textFieldStyle() {
    self.backgroundColor = .clear
    self.layer.borderColor = #colorLiteral(red: 0.6352941176, green: 0.5176470588, blue: 0.368627451, alpha: 1)
    self.layer.borderWidth = 1.5
    self.layer.cornerRadius = 7
    self.placeholder = "Select Date"
    self.attributedPlaceholder = NSAttributedString(string: self.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
 }
    func incomeExpenseTextFieldStyle() {
       self.backgroundColor = .clear
       self.layer.borderColor = #colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8666666667, alpha: 1)
        self.layer.borderWidth = 0.7
       self.layer.cornerRadius = 7
    }
    
    var stringValue: String {
        return self.text ?? ""
    }
}

extension UIViewController {
    func hideDatePicker() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissDatePicker))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissDatePicker() {
        dismiss(animated: true, completion: nil)
    }
    
    func alertBox(completion:@escaping ()->()) {
        let alert = AlertService.shared.alert(title: "Success", message: "Transaction Added Successfully.", alertType: .forceActionAlert, completion: {
            self.dismiss(animated: true, completion: {
                completion()
            })
        }, failure: {})
        alert.modalTransitionStyle = .crossDissolve
        self.present(alert, animated: true)
    }
    
    func deleteAlertBox(completion:@escaping ()->()) {
        let alert = AlertService.shared.alert(title: "Warning", message: "Are you sure want to delete?", alertType: .actionAlert, completion: {
            self.dismiss(animated: true, completion: {
                completion()
            })
        }) {
            self.dismiss(animated: true)
        }
        alert.modalTransitionStyle = .crossDissolve
        self.present(alert, animated: true)
    }
}

extension Date {
    
    var currentMonthYear: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-yyyy"
        return dateFormatter.string(from: self)
    }

    func startOfMonth() -> Date {
        var components = Calendar.current.dateComponents([.year,.month], from: self)
        components.day = 1
        let firstDateOfMonth: Date = Calendar.current.date(from: components)!
        return firstDateOfMonth
    }

    func nextDate() -> Date {
        let nextDate = Calendar.current.date(byAdding: .day, value: 30, to: self)
        return nextDate ?? Date()
    }

    func formatter() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateFormat = "dd-MMM-yyyy"
        let date = formatter.string(from: self)
        return date
    }
}

extension UIView {
    func setRoundedCornerView() {
        self.layer.cornerRadius = 10.0
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1.0
        self.layer.borderColor = #colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8666666667, alpha: 1)
    }
}

extension UINavigationController {
    func navigationStyle() {
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .medium), NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.6352941176, green: 0.5176470588, blue: 0.368627451, alpha: 1)]
        self.navigationBar.barTintColor = .white
        self.navigationBar.isTranslucent = false
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.tintColor = #colorLiteral(red: 0.6352941176, green: 0.5176470588, blue: 0.368627451, alpha: 1)
    }

    func removeViewController(_ controller: UIViewController.Type) {
        if let viewController = viewControllers.first(where: { $0.isKind(of: controller.self) }) {
            viewController.removeFromParent()
        }
    }
}

extension UINavigationItem {
    func backButtonStyle() {
        self.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    }
}

extension UIButton {
    func setShadowStyle() {
        let border = UIView()
        border.translatesAutoresizingMaskIntoConstraints = false
        border.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMinYCorner]
        border.layer.borderWidth = 2
        border.layer.cornerRadius = 7.0
        border.layer.shadowColor = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 0.3673480308)
        border.layer.shadowOffset = CGSize(width: -0.4, height: -0.4)
        border.layer.shadowOpacity = 1.0
        border.layer.shadowRadius = 0.2
        self.addSubview(border)
        let leftConstraint = leadingAnchor.constraint(equalTo: border.leadingAnchor)
        let topConstraint = topAnchor.constraint(equalTo: border.topAnchor)
        let rightConstraint = trailingAnchor.constraint(equalTo: border.trailingAnchor)
        let heightConstraint = border.heightAnchor.constraint(equalToConstant: 7.5)
        NSLayoutConstraint.activate([leftConstraint, topConstraint, rightConstraint, heightConstraint])
        backgroundColor = #colorLiteral(red: 0.6352941176, green: 0.5176470588, blue: 0.368627451, alpha: 1)
        border.backgroundColor = #colorLiteral(red: 0.6352941176, green: 0.5176470588, blue: 0.368627451, alpha: 1)
        border.layer.borderColor = #colorLiteral(red: 0.6352941176, green: 0.5176470588, blue: 0.368627451, alpha: 1)
        isEnabled = true
        isUserInteractionEnabled = true
        setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3969659674)
        layer.shadowOffset = CGSize(width: 0.3, height: 1.5)
        layer.cornerRadius = 7.0
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 0.6
    }
}

extension UITableView {
    func tableViewUIStyle() {
        self.backgroundColor = .clear
        self.separatorColor = .clear
    }
}
