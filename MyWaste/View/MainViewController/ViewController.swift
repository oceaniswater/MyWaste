//
//  ViewController.swift
//  MyWaste
//
//  Created by Марк Голубев on 20.02.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let addCollectionDayTitle: UILabel = {
        let label = UILabel()
        label.text = "The nearest collection day"
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    let addCollectionDayInfoView: CollectionDayView = {
        let view = CollectionDayView()
        return view
    }()
    
    let addScheduleTitle: UILabel = {
        let label = UILabel()
        label.text = "Collection waste schedule"
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    let addCalendarView: CalendarView = {
        let calendar = CalendarView()
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
    
    let addCollectionView: CollectionBinView = {
        let collection = CollectionBinView()
        return collection
    }()
    
    
    
//    let bins: [Bin] = [Bin(type: .ewaste), Bin(type: .paper), Bin(type: .plastic), Bin(type: .glass), Bin(type: .organic), Bin(type: .metal)]
//    let info = CollectionDayViewInfo(textInfo: "Friday, February 25", bins: [Bin(type: .ewaste), Bin(type: .paper), Bin(type: .plastic)])
    
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
        title = "MyWaste"
        // Set the color of the title text to red
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "BinsColorText")]
        navBar.titleTextAttributes = attributes as [NSAttributedString.Key : Any]
        navigationItem.backButtonTitle = "Back"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        


//        addCollectionDayInfoView.configure(with: info)
//        addCollectionView.configure(with: bins)
        initialize()
    }
    
    @objc func addButtonPressed() {
        let secondVC = AddBinViewController()
        navigationController?.pushViewController(secondVC, animated: true)
        
//        let modalViewController = AddBinViewController()
//        modalViewController.modalPresentationStyle = .popover
//        present(modalViewController, animated: true, completion: nil)
        
    }
}

// MARK: - Setup UI

private extension ViewController {
     func initialize() {
        view.backgroundColor = UIColor(named: "BinsColorBackground")

        let scrollView = UIScrollView()
        view.addSubview(scrollView)

        scrollView.snp.makeConstraints { maker in
            maker.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(10)
            maker.top.equalTo(view.safeAreaLayoutGuide)
            maker.bottom.equalToSuperview()
        }

        scrollView.addSubview(addCollectionDayTitle)
        addCollectionDayTitle.snp.makeConstraints { maker in
            maker.leading.top.equalToSuperview()
        }

        scrollView.addSubview(addCollectionDayInfoView)
        addCollectionDayInfoView.snp.makeConstraints { maker in
            maker.leading.trailing.equalToSuperview()
            maker.top.equalTo(addCollectionDayTitle.snp.bottom).offset(10)
            maker.width.equalTo(scrollView.snp.width)
        }

        scrollView.addSubview(addScheduleTitle)
        addScheduleTitle.snp.makeConstraints { maker in
            maker.leading.equalToSuperview()
            maker.top.equalTo(addCollectionDayInfoView.snp.bottom).offset(10)
        }

        scrollView.addSubview(addCalendarView)
        addCalendarView.snp.makeConstraints { maker in
            maker.leading.trailing.equalToSuperview()
            maker.top.equalTo(addScheduleTitle.snp.bottom).offset(10)
            maker.width.equalTo(scrollView.snp.width)
        }

        let horizontalStackView = UIStackView(arrangedSubviews: [addBinsTitleLabel, addAddButton])
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = 10

        scrollView.addSubview(horizontalStackView)
        horizontalStackView.snp.makeConstraints { maker in
            maker.leading.trailing.equalToSuperview()
            maker.top.equalTo(addCalendarView.snp.bottom).offset(10)
        }

        scrollView.addSubview(addCollectionView)
        addCollectionView.snp.makeConstraints { maker in
            maker.leading.trailing.equalToSuperview()
            maker.top.equalTo(horizontalStackView.snp.bottom).offset(10)
            maker.bottom.equalToSuperview()
            maker.width.equalTo(scrollView.snp.width)
        }
    }
}


