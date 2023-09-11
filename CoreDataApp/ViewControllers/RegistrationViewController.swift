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
        
        fetchDataFromDB(login: login)
        
        if checkLoginIsUnique() {
            if passwordTextField.text == passwordConfirmationTextField.text {
                saveData(login: login, and: password)
                print("Data saved")
            } else {
                print("Passwords don't match")
            }
        } else {
            print("data is not unique")
        }
    }
    @IBAction func cancelButtonPressed() {
    }
}

//MARK: - Private Methods
extension RegistrationViewController {
    private func saveData(login: String, and password: String) {
        StorageManager.shared.create(login, password: password)
    }
    
    private func fetchDataFromDB(login: String) {
        StorageManager.shared.fetchData(login: login) { [weak self] result in
            switch result {
            case .success(let users):
                self?.users = users
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func checkLoginIsUnique() -> Bool {
        users.isEmpty
    }
}
