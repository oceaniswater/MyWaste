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
    var type: BinsType
}

enum BinsType: String {
    case metal = "binMetal"
    case organic = "binOrganic"
    case ewaste = "binEwaste"
    case paper = "binPaper"
    case glass = "binGlass"
    case plastic = "binPlastic"
    
}
