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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoTextLabel.text = user.login
    }
    
    @IBAction func deleteButtonPressed() {
        deleteAccount(user)
        print("Account was deleted")
        dismiss(animated: true)
    }
}

// MARK: - Private Methods
extension DetailsViewController {
    private func deleteAccount(_ user: User) {
        StorageManager.shared.delete(user)
    }
}
