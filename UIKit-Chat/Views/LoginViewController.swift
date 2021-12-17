//
//  LoginViewController.swift
//  UIKit-Chat
//
//  Created by Kalabishka Ivan on 16.12.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    let welcomeLabel = UILabel(text: "Welckome back:", font: .arial26())
    
    let loginWithLabel = UILabel(text: "Login with")
    let orLabel = UILabel(text: "or")
    let emailLabel = UILabel(text: "Email")
    let passwordLabel = UILabel(text: "Password")
    let needAnAccountLabel = UILabel(text: "Need an account")
    
    let googleButton = UIButton(title: "Google", titleColor: .black, backgroundColor: .mainWhite(), isShadow: true)
    let emailTextField = OneLineTextField(font: .arial20())
    let passwordTextField = OneLineTextField(font: .arial20())
    let loginButton = UIButton(title: "Login", titleColor: .white, backgroundColor: .buttonDark())
    let signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(.buttonRed(), for: .normal)
        button.titleLabel?.font = .arial20()
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        googleButton.customizedGoogleButton()
        setupConstraints()
    }
}

extension LoginViewController {
    private func setupConstraints() {
        let loginWithView = ButtonFormView(label: loginWithLabel, button: googleButton)
        let emailStackView = UIStackView(
            arrangedSubviews: [emailLabel, emailTextField],
            axis: .vertical,
            spacing: 0)
        let passwordStackView = UIStackView(
            arrangedSubviews: [passwordLabel, passwordTextField],
            axis: .vertical,
            spacing: 0)
        
        loginButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        let stackView = UIStackView(
            arrangedSubviews: [loginWithView, orLabel, emailStackView,
                               passwordStackView, loginButton],
            axis: .vertical,
            spacing: 40)
        
        let bottomStackView = UIStackView(
            arrangedSubviews: [needAnAccountLabel, signInButton],
            axis: .horizontal,
            spacing: 0)
        
        bottomStackView.alignment = .firstBaseline
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(welcomeLabel)
        view.addSubview(stackView)
        view.addSubview(bottomStackView)
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 60),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)])
        
        NSLayoutConstraint.activate([
            bottomStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
    
    
}

// MARK: - SwiftUI
import SwiftUI

struct LoginVCProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ContainerView().edgesIgnoringSafeArea(.all)
        }
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = LoginViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}
