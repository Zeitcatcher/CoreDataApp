//
//  RegistrationViewController.swift
//  CoreDataApp
//
//  Created by Arseniy Oksenoyt on 9/8/23.
//

import UIKit

class RegistrationViewController: UIViewController {

    private var users: [User] = []
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmationTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveButtonPressed() {
        guard let login = loginTextField.text, let password = passwordTextField.text else { return }
        saveData(login: login, and: password)
    }
    @IBAction func cancelButtonPressed() {
    }
}

//MARK: - Private Methods
extension RegistrationViewController {
    private func saveData(login: String, and password: String) {
        StorageManager.shared.create(login, password: password) { user in
            users.append(user)
        }
    }
}
