//
//  ViewController.swift
//  LoginApp
//
//  Created by Александр on 24.08.21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        passwordTextField.isSecureTextEntry = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        guard nameTextField.text == "Alex", passwordTextField.text == "password" else {
            let alertController = UIAlertController(title: "Invalid Login or Password", message: "Please, enter correct login and password", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
                self.passwordTextField.text = ""
            }
            
            alertController.addAction(okAction)
            
            present(alertController, animated: true, completion: nil)
            
            return
        }
        
        welcomeVC.label = nameTextField.text ?? ""
        
    }
    
    @IBAction func forgotUserNameButtonTapped() {
        alertController(with: "name", is: "Alex")
    }
    
    @IBAction func forgoyPasswordButtonTapped() {
        alertController(with: "password", is: "password")
    }
    
    private func alertController(with word: String, is sense: String) {
        let alertController = UIAlertController(title: "Oops!", message: "Your \(word) is \(sense) 😉", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.nameTextField.text = ""
            self.passwordTextField.text = ""
        }
        
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func unwindToLoginViewController(segue: UIStoryboardSegue) {
        nameTextField.text = ""
        passwordTextField.text = ""
    }
}

