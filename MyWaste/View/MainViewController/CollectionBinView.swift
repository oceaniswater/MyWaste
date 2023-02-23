//
//  CollectionBinView.swift
//  MyWaste
//
//  Created by Марк Голубев on 21.02.2023.
//

import UIKit

class CollectionBinView: UIView {
    // MARK: - Public functions
    
    func configure(with bin: [Bin]) {
        bins = bin
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
        static let binWidth: CGFloat = 100
        static let binHeight: CGFloat = 160
        static let contentInset: CGFloat = 16
    }
    
    // MARK: - Private properties
    private var collectionView: UICollectionView!
    private var bins: [Bin] = []
}

// MARK: - Private methods
private extension CollectionBinView {
    func initialize() {
        backgroundColor = UIColor(named: "BinsColorBlocks")
        layer.cornerRadius = 20
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(BinCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: BinCollectionViewCell.self))
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.height.equalTo(UIConstants.binHeight)
            make.edges.equalToSuperview().inset(UIConstants.contentInset)
        }
        
    }
    
}

// MARK: - UICollectionViewDataSource
extension CollectionBinView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        bins.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: BinCollectionViewCell.self), for: indexPath) as! BinCollectionViewCell
        let imageName = bins[indexPath.item].type.rawValue
        cell.configure(with: imageName)
        return cell
    }
    
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CollectionBinView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIConstants.binWidth, height: UIConstants.binHeight)
    }
}
