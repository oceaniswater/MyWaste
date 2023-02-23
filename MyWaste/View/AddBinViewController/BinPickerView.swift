//
//  BinPickerView.swift
//  MyWaste
//
//  Created by Марк Голубев on 22.02.2023.
//

import UIKit

protocol BinTypePickerDelegate {
    func getBinType(_ binPickerView: BinPickerView, _ binType: BinsType)
}

class BinPickerView: UIView {
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
    
    // MARK: - Public properties
    var delegate: BinTypePickerDelegate?
    
    // MARK: - Private constants
    
    private enum UIConstants {
        static let binWidth: CGFloat = 100
        static let binHeight: CGFloat = 160
        static let contentInset: CGFloat = 16
    }
    
    // MARK: - Private properties
    private let pickerView: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()
    
    let binsWasteType: [String: BinsType] = ["Organic": .organic,"Metal":.metal, "Glass": .glass, "Plastic": .plastic, "Paper": .paper, "E-waste": .ewaste]
}

// MARK: - Private methods
private extension BinPickerView {
    func initialize() {
        backgroundColor = UIColor(named: "BinsColorBlocks")
        layer.cornerRadius = 20
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        addSubview(pickerView)
        pickerView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIConstants.contentInset)
        }
        
        // Call delegate method to get the initial bin type
        let initialBinTypeRow = pickerView.selectedRow(inComponent: 0)
        guard let initialBinType = binsWasteType[Array(binsWasteType.keys)[initialBinTypeRow]] else { return }
        delegate?.getBinType(self, initialBinType)


        
    }
    
}

extension BinPickerView: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Array(binsWasteType.keys)[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard let type = binsWasteType[Array(binsWasteType.keys)[row]] else { return }
        delegate?.getBinType(self, type)
    }
    
    
}

extension BinPickerView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        binsWasteType.count
    }
    
}
