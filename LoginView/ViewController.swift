//
//  ViewController.swift
//  LoginView
//
//  Created by Глеб on 11.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var userNameValue: UITextField!
    @IBOutlet var passwordValue: UITextField!
    
    private let userName = "Borodachka"
    private let password = "Password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameValue.layer.cornerRadius = 15
        passwordValue.layer.cornerRadius = 15
        
        userNameValue.delegate = self
        passwordValue.delegate = self
        
        userNameValue.returnKeyType = UIReturnKeyType.next
        passwordValue.returnKeyType = UIReturnKeyType.done
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.welcomeText = "Welcome, \(userName)!"
    }
    
    @IBAction func getingUserName() {
        if userNameValue.text == userName {
            userNameValue.text = userName
        } else {
            showAlert(with: "", and: "Wrong User Name")
        }
    }
    
    @IBAction func getingPassword() {
        if passwordValue.text == password {
            passwordValue.text = password
        } else {
            passwordValue.text = ""
            showAlert(with: "", and: "Wrong Password")
        }
    }
    
    @IBAction func logInToTheSystem() {
        getingUserName()
        getingPassword()
    }
    
    @IBAction func forgotUserName() {
        showAlert(with: "User Name", and: "Your User Name is Borodachka")
    }
    
    @IBAction func forgotPassword() {
        showAlert(with: "Password", and: "Your Password is Password")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameValue.text = ""
        passwordValue.text = ""
    }
    
}

// MARK: - Private Methods

extension ViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        passwordValue.becomeFirstResponder()
    }
}
