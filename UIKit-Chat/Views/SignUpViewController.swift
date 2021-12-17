//
//  SignUpViewController.swift
//  UIKit-Chat
//
//  Created by Kalabishka Ivan on 15.12.2021.
//

import UIKit

class SignUpViewController: UIViewController {
    let welcomeLabel = UILabel(text: "Good to see you!", font: .arial26())
    
    let emailLabel = UILabel(text: "Email")
    let passwordLabel = UILabel(text: "Password")
    let confirmPasswordLabel = UILabel(text: "Confirm password")
    let alreadyOnBoardLabel = UILabel(text: "Already password")
    
    let emailTextField = OneLineTextField(font: .arial20())
    let passwordTextField = OneLineTextField(font: .arial20())
    let confirmPasswordTextField = OneLineTextField(font: .arial20())
    
    let signUpButton = UIButton(
        title: "Sign Up", titleColor: .white,
        backgroundColor: .buttonDark(), cornerRadius: 10)
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.buttonRed(), for: .normal)
        button.titleLabel?.font = .arial20()
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        setupConstraints()
    }
}

//  MARK: - SetupConstraints
extension SignUpViewController {
    private func setupConstraints() {
        
        // first Group
        let emailStackView = UIStackView(
            arrangedSubviews: [emailLabel, emailTextField],
            axis: .vertical,
            spacing: 0)
        
        let passwordStackView = UIStackView(
            arrangedSubviews: [passwordLabel, passwordTextField],
            axis: .vertical,
            spacing: 0)
        
        let confirmPasswordStackView = UIStackView(
            arrangedSubviews: [confirmPasswordLabel, confirmPasswordTextField],
            axis: .vertical,
            spacing: 0)
        
        signUpButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        let stackView = UIStackView(
            arrangedSubviews: [emailStackView, passwordStackView, confirmPasswordStackView, signUpButton],
            axis: .vertical,
            spacing: 40)
        
        let bottomStackView = UIStackView(
            arrangedSubviews: [alreadyOnBoardLabel, loginButton],
            axis: .horizontal,
            spacing: 10)
        bottomStackView.alignment = .firstBaseline
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(welcomeLabel)
        view.addSubview(stackView)
        view.addSubview(bottomStackView)
        
        /// WelcomeConstraint
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(lessThanOrEqualTo: view.topAnchor, constant: 80),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        /// TFs + Button constraints
        NSLayoutConstraint.activate([
            //            stackView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 160),
            stackView.topAnchor.constraint(greaterThanOrEqualTo: welcomeLabel.bottomAnchor, constant: 60),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
        /// Already password constraint
        NSLayoutConstraint.activate([
            bottomStackView.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 30),
            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
}

// MARK: - SwiftUI
import SwiftUI

struct SignUpVCProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ContainerView().edgesIgnoringSafeArea(.all)
        }
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = SignUpViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}
