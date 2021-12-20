//
//  SetupProfileViewController.swift
//  UIKit-Chat
//
//  Created by Kalabishka Ivan on 16.12.2021.
//

import UIKit

class SetupProfileViewController: UIViewController {
    
    let fillImageVIew = AddPhotoView()
    
    let fullNameLabel = UILabel(text: "Full Name")
    let aboutMeLabel = UILabel(text: "About Me")
    
    let fullNameTextField = OneLineTextField(font: .arial20())
    let aboutMeTextField = OneLineTextField(font: .arial20())
    
    let goToChatsButton = UIButton(
        title: "Go to Chats!", titleColor: .white,
        backgroundColor: .buttonDark(), cornerRadius: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupConstraints()
    }
}

// MARK: - Setup Constraints
extension SetupProfileViewController {
    private func setupConstraints() {
        
        let fullNameStackView = UIStackView(
            arrangedSubviews: [fullNameLabel, fullNameTextField],
            axis: .vertical,
            spacing: 0)
        
        let aboutMeStackView = UIStackView(
            arrangedSubviews: [aboutMeLabel, aboutMeTextField],
            axis: .vertical,
            spacing: 0)
        
        let bottomStackView = UIStackView(
            arrangedSubviews: [goToChatsButton],
            axis: .vertical,
            spacing: 0)
        
        let stackView = UIStackView(
            arrangedSubviews: [fullNameStackView, aboutMeStackView, bottomStackView],
            axis: .vertical,
            spacing: 40)
        
        goToChatsButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        fillImageVIew.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(fillImageVIew)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            fillImageVIew.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            fillImageVIew.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: fillImageVIew.bottomAnchor, constant: 40),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40 )
        ])
    }
}

// MARK: - SwiftUI
import SwiftUI

struct SetupProfileVCProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ContainerView().edgesIgnoringSafeArea(.all)
        }
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = SetupProfileViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}

