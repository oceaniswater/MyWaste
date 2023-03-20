//
//  WeekDayTableView.swift
//  MyWaste
//
//  Created by Марк Голубев on 22.02.2023.
//

import UIKit
import RealmSwift

protocol WeekDayTableViewDelegate {
    func getWeekdays(_ weekDayTableView: WeekDayTableView, _ weekdays: [Weekday])
}

class WeekDayTableView: UIView {
    // MARK: - Public functions
    
//    func configure(with weekdays: [Weekday]) {
//        self.weekdays = weekdays
//        weekdaysTableView.reloadData()
//    }
    
    // MARK: - Init
    init() {
        super.init(frame: .zero)
        initialize()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public properies
    var delegate: WeekDayTableViewDelegate?
    
    // MARK: - Private constants
    private enum UIConstants {
        static let contentInset: CGFloat = 16
    }
    
    // MARK: - Private properties
    private let weekdaysTableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .clear
        return table
    }()
    
    var weekdays: [Weekday] = {
        var weekdays = [Weekday]()
        var sunday: Weekday = {
            let sunday = Weekday()
            sunday.name = .sunday
            sunday.weekdayNumber = 1
            return sunday
        }()
        var monday: Weekday = {
            let monday = Weekday()
            monday.name = .monday
            monday.weekdayNumber = 2
            return monday
        }()
        var tuesday: Weekday = {
            let tuesday = Weekday()
            tuesday.name = .tuesday
            tuesday.weekdayNumber = 3
            return tuesday
        }()
        var wednesday: Weekday = {
            let wednesday = Weekday()
            wednesday.name = .wednesday
            wednesday.weekdayNumber = 4
            return wednesday
        }()
        var thursday: Weekday = {
            let thursday = Weekday()
            thursday.name = .thursday
            thursday.weekdayNumber = 5
            return thursday
        }()
        var friday: Weekday = {
            let friday = Weekday()
            friday.name = .friday
            friday.weekdayNumber = 6
            return friday
        }()
        var saturday: Weekday = {
            let saturday = Weekday()
            saturday.name = .saturday
            saturday.weekdayNumber = 7
            return saturday
        }()
        weekdays = [sunday, monday, tuesday, wednesday, thursday, friday, saturday]
        return weekdays
    }()

}

// MARK: - Private methods
extension WeekDayTableView {
    private func initialize() {
        backgroundColor = UIColor(named: "BinsColorBlocks")
        layer.cornerRadius = 20
        
        weekdaysTableView.delegate = self
        weekdaysTableView.dataSource = self
        
        // Register the cell for the table view
        weekdaysTableView.register(UITableViewCell.self, forCellReuseIdentifier: "weekdayCell")
        weekdaysTableView.isScrollEnabled = false

        addSubview(weekdaysTableView)
        weekdaysTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIConstants.contentInset)
            make.height.equalTo(300)
        }
        
    }
}

extension WeekDayTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        weekdays[indexPath.row].selected = !weekdays[indexPath.row].selected
        delegate?.getWeekdays(self, weekdays)
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadData()
    }
}

extension WeekDayTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weekdays.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weekdayCell", for: indexPath)
        cell.textLabel?.text = weekdays[indexPath.row].name.rawValue
        cell.accessoryType = weekdays[indexPath.row].selected ? .checkmark : .none
        cell.backgroundColor = .clear
        return cell
    }
    
    
}
