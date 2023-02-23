//
//  Weekday.swift
//  MyWaste
//
//  Created by Марк Голубев on 23.02.2023.
//

import Foundation
import RealmSwift

class Weekday: Object {
    @Persisted var name: Day = .monday
    @Persisted var weekdayNumber: Int = 2
    @Persisted var selected: Bool = false
    @Persisted var parentBin = LinkingObjects(fromType: Bin.self, property: "weekdays")
}

enum Day: String, PersistableEnum {
    case sunday = "Sunday"
    case monday = "Monday"
    case tuesday = "Tuesday"
    case wednesday = "Wednesday"
    case thursday = "Thursday"
    case friday = "Friday"
    case saturday = "Saturday"
}
