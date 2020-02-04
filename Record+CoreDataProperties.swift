//
//  Record+CoreDataProperties.swift
//  MoneyManager
//
//  Created by Tin Tun Aung on 23/01/2020.
//  Copyright © 2020 Tin Tun Aung. All rights reserved.
//
//

import Foundation
import CoreData


extension Record {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Record> {
        return NSFetchRequest<Record>(entityName: "Record")
    }

    @NSManaged public var amount: Double
    @NSManaged public var category: String
    @NSManaged public var createdDate: String
    @NSManaged public var note: String
    @NSManaged public var type: String

}
