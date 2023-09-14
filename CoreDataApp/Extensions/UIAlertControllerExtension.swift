//
//  UIAlertControllerExtension.swift
//  CoreDataApp
//
//  Created by Arseniy Oksenoyt on 9/13/23.
//

import UIKit

extension UIAlertController {
    static func createAlertController(withTitle title: String) -> UIAlertController {
        UIAlertController(title: title, message: "What are we doing?", preferredStyle: .alert)
    }
    
    func action(user: User, complition: @escaping(String) -> Void) {
        let saveAction = UIAlertAction(title: "Save", style: .default) { [weak self] _ in
            guard let newValue = self?.textFields?.first?.text else { return }
            guard !newValue.isEmpty else { return }
            complition(newValue)
            print("Test alert 2")
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        
        addAction(saveAction)
        addAction(cancelAction)
        addTextField { textField in
            textField.placeholder = "New password"            
        }
    }
}
