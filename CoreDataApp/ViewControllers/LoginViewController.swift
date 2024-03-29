//
//  ViewController.swift
//  CoreDataApp
//
//  Created by Arseniy Oksenoyt on 9/8/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    private var users: [User] = []

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginButtonPressed() {
        guard let login = loginTextField.text, let password = passwordTextField.text else { return }

        fetchDataFromDB(login: login)

        guard let user = users.first else {
            print("Something is wrong")
            return
        }
        
        if user.password == password {
            print("Horray")
            performSegue(withIdentifier: "detailViewControllerSegue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsVC = segue.destination as? DetailsViewController else { return }
        detailsVC.user = users.first
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        loginTextField.text = ""
        passwordTextField.text = ""
    }
}

//MARK: - Private Methods
extension LoginViewController {
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
}

