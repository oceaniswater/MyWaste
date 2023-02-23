//
//  WeekDayTableView.swift
//  MyWaste
//
//  Created by Марк Голубев on 22.02.2023.
//

import UIKit

class WeekDayTableView: UIView {
    // MARK: - Public functions
    
    func configure() {
//        bins = bin
//        collectionView.reloadData()
        weekdaysTableView.reloadData()
    }
    
    // MARK: - Init
    init() {
        super.init(frame: .zero)
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
    private let weekdaysTableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .clear
        return table
    }()
    
    let weekdays = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

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
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension WeekDayTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weekdays.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weekdayCell", for: indexPath)
        cell.textLabel?.text = weekdays[indexPath.row]
        cell.backgroundColor = .clear
        return cell
    }
    
    
}
