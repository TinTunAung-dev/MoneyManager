//
//  PassDataProtocol.swift
//  MoneyManager
//
//  Created by Tin Tun Aung on 20/01/2020.
//  Copyright © 2020 Tin Tun Aung. All rights reserved.
//

import Foundation
import UIKit

protocol SelectDateDelegate {
    func didSelectDate(_ selectedDate:Date)
    func didPressButton(_ button: UIButton!)
}

protocol SelectCategoryDelegate {
    func selectCategory(_ categoryName: String)
}
