//
//  ViewController.swift
//  LoginApp
//
//  Created by Александр on 24.08.21.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // MARK: - Private properties
    private let login = User.getUsernfo().login
    private let password = User.getUsernfo().password
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        
        if let viewControllers = tabBarController.viewControllers {
        
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                guard nameTextField.text == login,
                      passwordTextField.text == password else {
                    alertController(
                        title: "Invalid Login or Password",
                        message: "Please, enter correct login and password")
                    return
                }
                welcomeVC.name = User.getUsernfo().person.fullName
                
            } else if let navigationVC = viewController as? UINavigationController {
                let aboutUserVC = navigationVC.topViewController as! MoreInfoViewController
                aboutUserVC.aboutMe = User.getUsernfo().person.hobbies
            }
          }
        }
      }
    
    // MARK: - IBActions
    @IBAction func forgotUserNameButtonTapped() {
        alertController(title: "Oops!", message: "Your name is \(login) 😉")
    }
    
    @IBAction func forgoyPasswordButtonTapped() {
        alertController(title: "Oops!", message: "Your password is \(password) 😉")
    }
    
    @IBAction func unwindToLoginViewController(segue: UIStoryboardSegue) {
        nameTextField.text = ""
        passwordTextField.text = ""
    }
    
    // MARK: - Private Methods
    private func alertController(title: String, message: String) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.passwordTextField.text = ""
        }
        
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}

// MARK: - UITexFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            performSegue(withIdentifier: "WelcomeView", sender: nil)
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}
