//
//  CollectionDayViewInfo.swift
//  MyWaste
//
//  Created by Марк Голубев on 21.02.2023.
//

import UIKit
import RealmSwift

struct CollectionDayViewInfo {
    let textInfo: String
    let bins: Results<Bin>
}


