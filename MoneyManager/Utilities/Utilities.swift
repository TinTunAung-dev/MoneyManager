//
//  Utilities.swift
//  MoneyManager
//
//  Created by Tin Tun Aung on 20/01/2020.
//  Copyright © 2020 Tin Tun Aung. All rights reserved.
//

import Foundation

func printDebug(_ T: Any...) {
    #if DEBUG
    print(T)
    #endif
}

func getFormattedDate(stringDate: String) -> Date? {
    let dateFormatterGet = DateFormatter()
    dateFormatterGet.dateFormat = "dd-MM-yyyy"
    let date  = dateFormatterGet.date(from: stringDate)
    dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
    return date
}
