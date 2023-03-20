//
//  CalendarView.swift
//  MyWaste
//
//  Created by Марк Голубев on 21.02.2023.
//

import UIKit
import RealmSwift


class CalendarView: UIView {
    
    var components = [DateComponents]()
    
    var bins: Results<Bin>?
    
    let realm = try! Realm()
    
    // MARK: - Public functions
    
    func update() {
//        let dc = DateComponents(calendar: .current, era: 1, year: 2023, month: 3, day: 1)
//        components.append(dc)
//
//        calendarView.reloadDecorations(forDateComponents: components, animated: true)
    }
    
    // MARK: - Realm methods
    
    func loadBins() {
        bins = realm.objects(Bin.self)
    }
    
    // MARK: - Init
    init() {
        super.init(frame: .zero)
        loadBins()
        initialize()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private constants
    
    private enum UIConstants {
        static let binWidth: CGFloat = 100
        static let binHeight: CGFloat = 160
        static let contentInset: CGFloat = 16
    }
    
    // MARK: - Private properties
    private let calendarView: UICalendarView = {
        let calendar = UICalendarView()
        
        return calendar
    }()
    
}

// MARK: - Private methods
private extension CalendarView {
    func initialize() {
        backgroundColor = UIColor(named: "BinsColorBlocks")
        layer.cornerRadius = 20
        addSubview(calendarView)
        
        calendarView.delegate = self
        
        calendarView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIConstants.contentInset)
        }
        
    }
    
}

// MARK: - UICalendarViewDelegate
extension CalendarView: UICalendarViewDelegate {
    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
        
        guard let bins = bins else { return nil }
        var dict = [String: [String]]()
        
        for bin in bins {
            let color = bin.color
            for day in bin.weekdays {
                if day.selected {
                    if dict.contains(where: { $0.key == String(day.weekdayNumber) }) {
                        dict[String(day.weekdayNumber)]?.append(color)
                    } else {
                        dict.updateValue([color], forKey: String(day.weekdayNumber))
                    }
                }
                
            }
        }
        
        for k in dict.keys{
            guard let date = dateComponents.date else {return nil}

            if Calendar.current.component(.weekday, from: date) == Int(k) {
                let colorsList = dict[k]
                
                return .customView { [self] in
                    let colorCircleView = ColoredCircleView(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
                    var colors = [UIColor]()
                    if let colorsList = colorsList {
                        for color in colorsList {
                            colors.append(UIColor(hex: color))
                        }
                    }
                    colorCircleView.colors = colors
                    
                    
                    return colorCircleView
                    
                }
            }
        }
        
        return nil
    }
    
}


extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            self.init(red: 0, green: 0, blue: 0, alpha: alpha)
            return
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
}
