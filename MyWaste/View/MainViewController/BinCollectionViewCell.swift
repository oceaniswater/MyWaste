//
//  BinCollectionViewCell.swift
//  MyWaste
//
//  Created by Марк Голубев on 20.02.2023.
//

import UIKit
import SnapKit

class BinCollectionViewCell: UICollectionViewCell {
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private properties
    private let imageBin: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageBin.image = nil
    }
    
    // MARK: - Public methods
    func configure(with image: String) {
        imageBin.image = UIImage(named: image)
    }
}

// MARK: - Private methods

private extension BinCollectionViewCell {
    func initialize() {
        contentView.addSubview(imageBin)
        imageBin.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
        contentView.backgroundColor = .clear
    }
}
