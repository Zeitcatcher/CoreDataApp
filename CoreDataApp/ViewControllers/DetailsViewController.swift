//
//  DetailsViewController.swift
//  CoreDataApp
//
//  Created by Arseniy Oksenoyt on 9/8/23.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var user: User!

    @IBOutlet weak var infoTextLabel: UILabel!
    @IBOutlet weak var infoTextView: UITextView! {
        didSet {
            infoTextView.text =
                """
                Name: \(user.userProfile?. ?? "")
                Last Name:
                45
                """
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoTextLabel.text = user.login
    }
    
    @IBAction func deleteButtonPressed() {
        deleteAccount(user)
        print("Account was deleted")
        dismiss(animated: true)
    }
    @IBAction func changeButtonPressed() {
        showAlert(user: user)
    }
}

// MARK: - Private Methods
extension DetailsViewController {
    private func deleteAccount(_ user: User) {
        StorageManager.shared.delete(user)
    }
    
    private func showAlert(user: User) {
        let title = "Update password"
        print("Test Alert 1")
        
        let alert = UIAlertController.createAlertController(withTitle: title)
        alert.action(user: user) { newPassword in
            StorageManager.shared.update(user, newPassword: newPassword)
        }
        present(alert, animated: true)
    }
}
