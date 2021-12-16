//
//  AuthViewController.swift
//  UIKit-Chat
//
//  Created by Kalabishka Ivan on 03.12.2021.
//

import UIKit

class AuthViewController: UIViewController {
    let logoTitle = UILabel(text: "UIKit-Chat")
    let logoImageView = UIImageView(image: UIImage(systemName: "message.circle.fill"), contentMode: .scaleAspectFit)

    let googleLabel = UILabel(text: "Get started with")
    let emailLabel = UILabel(text: "Or sign up with")
    let alreadyOnboardLabel = UILabel(text: "Already onboard")

    let googleButton = UIButton(title: "Google", titleColor: .black, backgroundColor: .mainWhite(), isShadow: true)
    let emailButton = UIButton(title: "Email", titleColor: .white, backgroundColor: .buttonDark(), isShadow: true)
    let loginButton = UIButton(title: "Login", titleColor: .buttonRed(), backgroundColor: .mainWhite(), isShadow: true)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstraints()
    }
}

//  MARK: - SetupConstraints
extension AuthViewController {

    private func setupConstraints() {
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoTitle.translatesAutoresizingMaskIntoConstraints = false

        // определяем кнопки
        let googleVIew = ButtonFormView(label: googleLabel, button: googleButton)
        let emailView = ButtonFormView(label: emailLabel, button: emailButton)
        let loginView = ButtonFormView(label: alreadyOnboardLabel, button: loginButton)

        /// stackView для кнопок
        let stackView = UIStackView(
            arrangedSubviews: [googleVIew, emailView, loginView],
            axis: .vertical,
            spacing: 40)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        /// stackView для лого
        let logoStackView = UIStackView(
            arrangedSubviews: [logoTitle, logoImageView],
            axis: .vertical,
            spacing: 6)
        logoStackView.translatesAutoresizingMaskIntoConstraints = false
        logoStackView.alignment = .center

        view.addSubview(logoStackView)
        view.addSubview(stackView)

        // настраиваем констрейнты для лого
        NSLayoutConstraint.activate([
            logoStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            logoStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            logoStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)
        ])

        // настраиваем констрейнты для стеквью
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 160),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
}

// MARK: - SwiftUI
import SwiftUI

struct AuthVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {
        let viewController = AuthViewController()

        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}

// добавление расширения для uistackview
// 18 минута видео 6
