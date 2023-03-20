//
//  Alerts.swift
//  MyWaste
//
//  Created by Марк Голубев on 24.02.2023.
//

import UIKit

extension UIViewController {
    
    // MARK: - Update name alert
    
//    func alertUpdateName(indexPath: IndexPath, title: String, oldName: String, completionHandler: @escaping (String) -> Void) {
//        // created controller
//        let ac = UIAlertController(title: title, message: nil, preferredStyle: .alert)
//        // added TextField
//        ac.addTextField()
//        ac.textFields?.first?.text = oldName
//
//
//        // created update button
//        let updateAction = UIAlertAction(title: "Update", style: .default) {
//            // trying to avoid strong reference
//            [weak ac] action in
//            // checked textField is not nil
//            guard let newName = ac?.textFields?.first?.text, newName != "" else { return }
//            completionHandler(newName)
//
//        }
//
//        // created dismis button
//        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) {
//            // trying to avoid strong reference
//            [weak self] _ in
//            self?.tableView.reloadData()
//        }
//
//        ac.addAction(updateAction)
//        ac.addAction(cancelAction)
//        present(ac, animated: true)
//    }
    
    // MARK: - Add bin alert
    
    func alertAddBinError(title: String, message: String) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)

        // created dismis button
        let cancelAction = UIAlertAction(title: "Ok", style: .destructive)

        ac.addAction(cancelAction)
        present(ac, animated: true)
    }
    
}

