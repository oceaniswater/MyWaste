//
//  CalendarView.swift
//  MyWaste
//
//  Created by Марк Голубев on 21.02.2023.
//

import UIKit

class CalendarView: UIView {
    // MARK: - Public functions
    
    func configure(with bin: [Bin]) {
//        bins = bin
//        collectionView.reloadData()
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
        calendarView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIConstants.contentInset)
        }

        
    }
    
}
