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
    
    private let user = User.getUserData()
    
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
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        viewControllers.forEach {
            if let welcomeVC = $0 as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navigationVC = $0 as? UINavigationController {
                let moreInfoVC = navigationVC.topViewController as! MyProfileViewController
                moreInfoVC.user = user
                }
            }
        }
    
    // MARK: - IBActions
    
    @IBAction func logginButtonPressed() {
        if  nameTF.text != user.login || passwordTF.text != user.password {
            showAlert(whith: "User Name or Password incorrect",
                      and: "Please input correct User Name or Password")
            passwordTF.text = nil
        }
    }
    
    @IBAction func forgotNameButtonPressed() {
        showAlert(whith: "Forgot User Name?",
                  and: "You user name is \"\(user.login)\"!")
    }
    
    @IBAction func forgotPasswordButtonPressed() {
        showAlert(whith: "Forgot Password?",
                  and: "You password is \"\(user.password)\"!")
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

