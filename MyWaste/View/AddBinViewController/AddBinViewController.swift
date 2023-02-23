//
//  AddBinViewController.swift
//  MyWaste
//
//  Created by Марк Голубев on 20.02.2023.
//

import UIKit

class AddBinViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // this block for set up navigation bar
        guard let navBar = navigationController?.navigationBar else { return }
//        navBar.tintColor = UIColor.white
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "BinsColorBackground")
        
        navBar.standardAppearance = appearance
        navBar.scrollEdgeAppearance = appearance
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        
    }
    
    // MARK: - Private constants
    
    private enum UIConstants {
        static let binWidth: CGFloat = 100
        static let binHeight: CGFloat = 160
        static let contentInset: CGFloat = 16
    }
    
    // MARK: - Private Properties
    
    private let addBinImageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private let addPickerTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose waste type"
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    private let addBinPickerView: BinPickerView = {
        let picker = BinPickerView()
        return picker
    }()
    
    private let addWeekdaysTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose collection weekdays"
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    private let addWeekDayTableView: WeekDayTableView = {
        let view = WeekDayTableView()
        return view
    }()
    
    private let addCreateButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "BinsColorButtonBackground")
        button.layer.cornerRadius = 20
        button.setTitle("Add bin", for: .normal)
        button.setTitleColor(UIColor(named: "BinsColorButtonText"), for: .normal)
        button.addTarget(self, action: #selector(createButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private var initialBinType: BinsType?
    
    @objc func createButtonPressed() {
        
    }
}

private extension AddBinViewController {
    func initialize() {
        view.backgroundColor = UIColor(named: "BinsColorBackground")
        // могу ли я настраивать первую картинку так же через делегат?
        if let initialBinType = addBinPickerView.binsWasteType.first?.value {
            addBinImageView.image = UIImage(named: initialBinType.rawValue)
        }
        
        let scrollView = UIScrollView()
        view.addSubview(scrollView)

        scrollView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalToSuperview()
        }
        
        scrollView.addSubview(addBinImageView)
        addBinImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(UIConstants.binHeight)
            make.width.equalTo(UIConstants.binWidth)
            
        }
        
        scrollView.addSubview(addPickerTitleLabel)
        addPickerTitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.top.equalTo(addBinImageView.snp.bottom).offset(10)
            make.width.equalTo(scrollView.snp.width)
        }
        
        addBinPickerView.delegate = self
        scrollView.addSubview(addBinPickerView)
        addBinPickerView.snp.makeConstraints { make in
            make.trailing.leading.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.top.equalTo(addPickerTitleLabel.snp.bottom).offset(10)
            make.width.equalTo(scrollView.snp.width)
        }
        
        scrollView.addSubview(addWeekdaysTitleLabel)
        addWeekdaysTitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.top.equalTo(addBinPickerView.snp.bottom).offset(10)
            make.width.equalTo(scrollView.snp.width)
        }
        
        scrollView.addSubview(addWeekDayTableView)
        addWeekDayTableView.snp.makeConstraints { make in
            make.trailing.leading.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.top.equalTo(addWeekdaysTitleLabel.snp.bottom).offset(10)
            make.width.equalTo(scrollView.snp.width)
        }
        
        scrollView.addSubview(addCreateButton)
        addCreateButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(addWeekDayTableView.snp.bottom).offset(10)
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.bottom.equalToSuperview()
        }
    }
}

extension AddBinViewController: BinTypePickerDelegate {
    func getBinType(_ binPickerView: BinPickerView, _ binType: BinsType) {
        DispatchQueue.main.async { [self] in
            let image = binType.rawValue
            addBinImageView.image = UIImage(named: image)
        }
    }
    
    
}
