//
//  ViewController.swift
//  LessonThreeCorrection
//
//  Created by Philip Noskov on 01.04.2021.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    // MARK: - Private Properties
    
    private var userName = "User"
    private var userPassword = "12345678"
    
    // MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTF.delegate = self
        passwordTF.delegate = self
    }
   
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else {
            return
        }
        welcomeVC.userName = nameTF.text
    }
    
    // MARK: - IBActions
    
    @IBAction func logginButtonPressed() {
        if  nameTF.text != userName || passwordTF.text != userPassword {
            showAlert(whith: "User Name or Password incorrect",
                      and: "Please input correct User Name or Password")
            passwordTF.text = nil
        }
    }
    
    @IBAction func forgotNameButtonPressed() {
        showAlert(whith: "Forgot User Name?",
                  and: "You user name is \"\(userName)\"!")
    }
    
    @IBAction func forgotPasswordButtonPressed() {
        showAlert(whith: "Forgot Password?",
                  and: "You password is \"\(userPassword)\"!")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        nameTF.text = nil
        passwordTF.text = nil
    }
    
    // MARK: - Public Methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTF {
            passwordTF.becomeFirstResponder()
        } else if textField == passwordTF {
            self.logginButtonPressed()
            performSegue(withIdentifier: "goToWelcomeScene", sender: self)
        }
        return true
    }
    
    // MARK: - Private Methods
    
    private func showAlert(whith title: String, and message: String) {
        let alertMessage = UIAlertController(title: title,
                                            message: message,
                                            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertMessage.addAction(okAction)
        present(alertMessage, animated: true)
    }
}

