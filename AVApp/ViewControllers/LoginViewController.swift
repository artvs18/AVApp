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
    
    private let user = User.getUserInfo()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarVC = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarVC.viewControllers else { return }
        
        viewControllers.forEach { viewController in
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.username = user.username
            } else if let navigationVC = viewController as? UINavigationController {
                guard let userVC = navigationVC.topViewController as? UserViewController else { return }
                userVC.title = "\(user.person.name) \(user.person.surname)"
                userVC.name = user.person.name
                userVC.surname = user.person.surname
                userVC.birthday = user.person.birthday
            }
        }
    }
    
    @IBAction func logInButtonTapped() {
        guard usernameTF.text == user.username, passwordTF.text == user.password else {
            showAlert(
                with: "ERROR",
                and: "Wrong Username or Password",
                textField: passwordTF
            )
            return
        }
        performSegue(withIdentifier: "showTabBarVC", sender: nil)
    }
    
    @IBAction func showTip(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(with: "Hint💡", and: "Your Username is \(user.username)")
        : showAlert(with: "Hint💡", and: "Your Password is \(user.password)")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        usernameTF.text = ""
        passwordTF.text = ""
    }
}

extension LoginViewController {
    private func showAlert(with title: String, and message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
