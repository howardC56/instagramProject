//
//  LoginViewController.swift
//  instagramProject
//
//  Created by Howard Chang on 3/5/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit


enum AccountState {
  case existingUser
  case newUser
}

class LoginViewController: UIViewController {

    let logView = LoginView()
    private var accountState: AccountState = .newUser
     
     private var authSession = AuthenticationSession()
    override func loadView() {
        view = logView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        clearErrorLabel()
        logView.accountStateButton.addTarget(self, action: #selector(toggleAccountState(_:)), for: .touchUpInside)
        logView.signUpButton.addTarget(self, action: #selector(loginButtonPressed(_:)), for: .touchUpInside)
    }
    
    @objc private func loginButtonPressed(_ sender: UIButton) {
        guard let email = logView.emailTextField.text,
        !email.isEmpty,
            let password = logView.passwordTextField.text,
        !password.isEmpty else {
          showAlert(title: "Missing Fields", message: "Please Fill In All Fields")
          return
      }
      continueLoginFlow(email: email, password: password)
    }
    
    private func continueLoginFlow(email: String, password: String) {
      if accountState == .existingUser {
        authSession.signExistingUser(email: email, password: password) { [weak self] (result) in
          switch result {
          case .failure(let error):
            DispatchQueue.main.async {
                self?.logView.errorLabel.text = "\(error.localizedDescription)"
                self?.logView.errorLabel.textColor = .systemRed
            }
          case .success:
            DispatchQueue.main.async {
              self?.navigateToMainView()
            }
          }
        }
      } else {
        authSession.createNewUser(email: email, password: password) { [weak self] (result) in
          switch result {
          case .failure(let error):
            DispatchQueue.main.async {
              self?.logView.errorLabel.text = "\(error.localizedDescription)"
              self?.logView.errorLabel.textColor = .systemRed
            }
          case .success:
            DispatchQueue.main.async {
              self?.navigateToMainView()
            }
          }
        }
      }
    }
    
    private func navigateToMainView() {
        navigationController?.pushViewController(MainTabBarController(), animated: true)
     }
     
     private func clearErrorLabel() {
        logView.errorLabel.text = ""
     }

@objc private func toggleAccountState(_ sender: UIButton) {
  accountState = accountState == .newUser ? .existingUser : .newUser
  
  if accountState == .existingUser {
    logView.signUpButton.setTitle("Login", for: .normal)
    logView.loginLabel.text = "Don't have an account? -->"
    logView.accountStateButton.setTitle("Sign Up", for: .normal)
 
  } else {
      logView.signUpButton.setTitle("Sign Up", for: .normal)
      logView.loginLabel.text = "If you have an Account --> "
      logView.accountStateButton.setTitle("Login", for: .normal)
  }
}

}
