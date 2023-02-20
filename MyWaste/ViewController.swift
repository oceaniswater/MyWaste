//
//  ViewController.swift
//  MyWaste
//
//  Created by Марк Голубев on 20.02.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let addTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "MyWasteApp"
        label.font = UIFont.systemFont(ofSize: 40)
        return label
    }()
    
    let addCalendar: UICalendarView = {
        let calendar = UICalendarView()
        calendar.backgroundColor = UIColor(red: 1.00, green: 0.92, blue: 0.65, alpha: 1.00)
        return calendar
    }()
    
    let addBinsTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "My Bins"
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    let addAddButton: UIButton = {
        let button = UIButton(type: .contactAdd)
//        button.setTitle("Add", for: .normal)
        button.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let addCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.collectionViewLayout = layout
        collection.backgroundColor = .clear
        collection.register(BinCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collection
    }()
    
    let addCollectionDayTitle: UILabel = {
        let label = UILabel()
        label.text = "The nearest collection day"
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    let addCollectionDayInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Friday, 25 Feb, Black bins are expected"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30)
        return label
    }()
    
    
    
    var data = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addCollectionView.dataSource = self
        addCollectionView.delegate = self
        
        initialize()
    }
    
    @objc func addButtonPressed() {
//        let secondVC = AddBinViewController()
//        navigationController?.pushViewController(secondVC, animated: true)
        
        let modalViewController = AddBinViewController()
        modalViewController.modalPresentationStyle = .popover
        present(modalViewController, animated: true, completion: nil)
        
    }
}

// MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BinCollectionViewCell
        cell.backgroundColor = .purple
        
        cell.configure(with: data[indexPath.row])
        
        return cell
    }
    
}

// MARK: - Setup UI

extension ViewController {
    
    private func initialize() {
        view.backgroundColor = UIColor(red: 1.00, green: 0.92, blue: 0.65, alpha: 1.00)
        
        view.addSubview(addTitleLabel)
        addTitleLabel.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(10)
            maker.top.equalToSuperview().inset(50)
        }
        
        view.addSubview(addCalendar)
        addCalendar.snp.makeConstraints { maker in
            maker.left.right.equalToSuperview()
            maker.top.equalTo(addTitleLabel.snp.bottom).offset(10)
        }
        
        let horizontalStackView = UIStackView(arrangedSubviews: [addBinsTitleLabel, addAddButton])
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = 10
//        horizontalStackView.alignment = .leading

        view.addSubview(horizontalStackView)
        horizontalStackView.snp.makeConstraints { maker in
            maker.left.right.equalToSuperview().inset(10)
            maker.top.equalTo(addCalendar.snp.bottom).offset(10)
        }

        view.addSubview(addCollectionView)
        addCollectionView.snp.makeConstraints { maker in
            maker.left.right.equalToSuperview()
            maker.top.equalTo(horizontalStackView.snp.bottom).offset(10)
            maker.height.equalTo(100)
        }
        
        view.addSubview(addCollectionDayTitle)
        addCollectionDayTitle.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(10)
            maker.top.equalTo(addCollectionView.snp.bottom).offset(10)
        }
        
        view.addSubview(addCollectionDayInfoLabel)
        addCollectionDayInfoLabel.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.left.right.equalToSuperview().inset(30)
            maker.top.equalTo(addCollectionDayTitle.snp.bottom).offset(10)
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
}

