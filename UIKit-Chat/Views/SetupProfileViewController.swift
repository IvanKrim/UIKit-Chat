//
//  SetupProfileViewController.swift
//  UIKit-Chat
//
//  Created by Kalabishka Ivan on 16.12.2021.
//

import UIKit

class SetupProfileViewController: UIViewController {
    
    let fillImageVIew = AddPhotoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .white
        
        setupConstraints()
    }
}

// MARK: - Setup Constraints
extension SetupProfileViewController {
    private func setupConstraints() {
        
        fillImageVIew.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(fillImageVIew)
        
        NSLayoutConstraint.activate([
            fillImageVIew.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            fillImageVIew.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        
        // виидео 9 19я минута
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

