//
//  Constants.swift
//  MoneyManager
//
//  Created by Tin Tun Aung on 20/01/2020.
//  Copyright © 2020 Tin Tun Aung. All rights reserved.
//

import Foundation

enum AlertType {
    case actionAlert
    case simpleAlert
    case forceActionAlert
}

struct Constants {
    static let textColor = "textColor"
    static let addIncome = "Add Income"
    static let addExpense = "Add Expense"
    static let numbers = "0123456789"
    static let emptyString = ""
}

struct DefaultsKey {
    static let saveDateKey = "SaveDateKey"
}

struct NibName {
    static let selectDateNib = "SelectDateViewController"
    static let selectCategoryNib = "SelectCategoryTableViewCell"
    static let transactionNib = "TransactionsTableViewCell"
    static let transactionDetailNib = "TransactionDetailTableViewCell"
}

struct CellID {
    static let selectCategoryCell = "selectCategoryCell"
    static let transactionCell = "transactionCell"
    static let transactionDetailCell = "transactionDetailCell"
}

struct ScreenName {
    static let addIncome = "Add Income"
    static let addExpense = "Add Expense"
    static let showTransactions = "Show Transactions"
}
