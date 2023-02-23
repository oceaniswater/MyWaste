//
//  WeekdayCell.swift
//  MyWaste
//
//  Created by Марк Голубев on 22.02.2023.
//

import UIKit

class WeekdayCell: UITableViewCell {
    // MARK: - Public methods
    func configure(text: String) {
        label.text = text
    }
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private properties
    private let label: UILabel = {
        let label = UILabel()
        return label
    }()
}

// MARK: - Private methods

private extension WeekdayCell {
    func initialize() {
        contentView.addSubview(label)
        label.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
        contentView.backgroundColor = .clear
    }
}
