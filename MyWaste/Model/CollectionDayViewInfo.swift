//
//  CollectionDayViewInfo.swift
//  MyWaste
//
//  Created by Марк Голубев on 21.02.2023.
//

import UIKit

struct CollectionDayViewInfo {
    let textInfo: String
    let bins: [Bin]
}

struct Bin {
    let type: BinsType
    let collectionWeekdays: [Weekday] = [Weekday(name: .monday, selected: true)]
    let color: String? = "#f1c40f"
}

struct Weekday {
    let name: Day
    var selected: Bool = false
}

enum Day: String {
    case sunday = "Sunday"
    case monday = "Monday"
    case tuesday = "Tuesday"
    case wednesday = "Wednesday"
    case thursday = "Thursday"
    case friday = "Friday"
    case saturday = "Saturday"
}

enum BinsType: String {
    case metal = "binMetal"
    case organic = "binOrganic"
    case ewaste = "binEwaste"
    case paper = "binPaper"
    case glass = "binGlass"
    case plastic = "binPlastic"
    
}
