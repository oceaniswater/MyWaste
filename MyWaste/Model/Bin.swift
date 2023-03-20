//
//  Bin.swift
//  MyWaste
//
//  Created by Марк Голубев on 23.02.2023.
//

import Foundation
import RealmSwift

class Bin: Object {
    @Persisted var type: BinsType = .paper {
        didSet {
            switch type {
                
            case .metal:
                color = "#f1c40f"
            case .organic:
                color = "#2c3e50"
            case .ewaste:
                color = "#e74c3c"
            case .paper:
                color = "#3498db"
            case .glass:
                color = "#2ecc71"
            case .plastic:
                color = "#f39c12"
            }
        }
    }
    @Persisted var color: String = "#2c3e50"
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
