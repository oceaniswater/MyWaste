//
//  Bin.swift
//  MyWaste
//
//  Created by Марк Голубев on 23.02.2023.
//

import Foundation
import RealmSwift

class Bin: Object {
    @Persisted var type: BinsType = .paper
    @Persisted var color: String = "#f1c40f"
    @Persisted var weekdays = List<Weekday>()
}

enum BinsType: String, PersistableEnum {
    case metal = "binMetal"
    case organic = "binOrganic"
    case ewaste = "binEwaste"
    case paper = "binPaper"
    case glass = "binGlass"
    case plastic = "binPlastic"
    
}
