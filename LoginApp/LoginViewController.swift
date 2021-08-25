//
//  ViewController.swift
//  LoginApp
//
//  Created by Александр on 24.08.21.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        passwordTextField.delegate = self
        registerForKeyboardNotification()
    }
    
    deinit {
        removeKeyboardNotifications()
    }
    
    func registerForKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func removeKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        guard let info = notification.userInfo,
              let keyboardFrameValue = info[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue else { return }
        
        let keyboardFrame = keyboardFrameValue.cgRectValue
        let keyboardSize = keyboardFrame.size
        
//        Код работает криво, так и не нашел способ поднять контент над клавиатурой без использования scrollView, надеюсь на вашу подсказку.
//        self.view.frame.origin.y -= keyboardSize.height
    }
    
    @objc func keyboardWillBeHide() {
       if self.view.frame.origin.y != 0 {
        self.view.frame.origin.y = 0
       }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        
        guard nameTextField.text == "Alex",
              passwordTextField.text == "password" else {
            check()
            return
        }
        
        welcomeVC.label = nameTextField.text ?? ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func forgotUserNameButtonTapped() {
        alertController(with: "name", is: "Alex")
    }
    
    @IBAction func forgoyPasswordButtonTapped() {
        alertController(with: "password", is: "password")
    }
    
    @IBAction func unwindToLoginViewController(segue: UIStoryboardSegue) {
        nameTextField.text = ""
        passwordTextField.text = ""
    }
    
    private func alertController(with word: String, is sense: String) {
        let alertController = UIAlertController(
            title: "Oops!",
            message: "Your \(word) is \(sense) 😉",
            preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.nameTextField.text = ""
            self.passwordTextField.text = ""
        }
        
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    private func check() {
        let alertController = UIAlertController(
            title: "Invalid Login or Password",
            message: "Please, enter correct login and password",
            preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.passwordTextField.text = ""
        }
        
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
// пытаюсь передать данные, но ничего не работает, тоже не могу понять причину. Буду благодарен за пояснения
            func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
                
                guard nameTextField.text == "Alex",
                      passwordTextField.text == "password" else {
                    check()
                    return
                }
                
                welcomeVC.label = nameTextField.text ?? ""
            }
        default:
            textField.resignFirstResponder()
        }
        return false
    }
}

