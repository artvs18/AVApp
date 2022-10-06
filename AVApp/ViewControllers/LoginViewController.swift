//
//  LoginViewController.swift
//  AVApp
//
//  Created by Artemy Volkov on 04.10.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var usernameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    private let user = User.getUser()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTF.text = user.login
        passwordTF.text = user.password
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else {
            return
        }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        viewControllers.forEach {
            if let welcomeVC = $0 as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navigationVC = $0 as? UINavigationController {
                let userVC = navigationVC.topViewController
                guard let userVC = userVC as? UserViewController else { return }
                userVC.user = user
            }
        }
    }
    
    @IBAction func logInButtonTapped() {
        guard usernameTF.text == user.login,
                passwordTF.text == user.password else {
            showAlert(
                with: "ERROR",
                and: "Wrong Username or Password",
                textField: passwordTF
            )
            return
        }
        performSegue(withIdentifier: "showWelcomeVC", sender: nil)
    }
    
    @IBAction func showTip(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(with: "Hint💡", and: "Your Username is \(user.login)")
        : showAlert(with: "Hint💡", and: "Your Password is \(user.password)")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        usernameTF.text = ""
        passwordTF.text = ""
    }
    
    private func showAlert(with title: String, and message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
