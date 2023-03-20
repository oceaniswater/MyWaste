//
//  CollectionDayView.swift
//  MyWaste
//
//  Created by Марк Голубев on 21.02.2023.
//

import SnapKit
import UIKit
import RealmSwift

class CollectionDayView: UIView {
    // MARK: - Public functions
    
    func configure(with info: CollectionDayViewInfo) {
        collectionDayInfoLabel.text = info.textInfo
        bins = info.bins
        collectionView.reloadData()
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
        static let binWidth: CGFloat = 40
        static let binHeight: CGFloat = 70
        static let contentInset: CGFloat = 16
    }
    
    
    // MARK: - Private properties
    private let collectionDayInfoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor(named: "BinsColorText")
        return label
    }()
    
    private var collectionView: UICollectionView!
    private var bins: Results<Bin>?

    
}

// MARK: - Private methods
private extension CollectionDayView {
    func initialize() {
        backgroundColor = UIColor(named: "BinsColorBlocks")
        layer.cornerRadius = 20
        let yStack = UIStackView()
        yStack.axis = .vertical
        collectionDayInfoLabel.snp.makeConstraints { make in
            make.height.equalTo(20)
        }
        yStack.addArrangedSubview(collectionDayInfoLabel)
        
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(BinCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: BinCollectionViewCell.self))
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.snp.makeConstraints { make in
            make.height.equalTo(UIConstants.binHeight)
        }
        yStack.addArrangedSubview(collectionView)
        addSubview(yStack)
        yStack.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIConstants.contentInset)
        }
        
    }
}

// MARK: - UICollectionViewDataSource
extension CollectionDayView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let bins = bins {
            return bins.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: BinCollectionViewCell.self), for: indexPath) as! BinCollectionViewCell
        if let bins = bins {
            let imageName = bins[indexPath.item].type.rawValue
            cell.configure(with: imageName)
            return cell
        } else {
            return cell
        }
    }
    
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CollectionDayView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIConstants.binWidth, height: UIConstants.binHeight)
    }
}
