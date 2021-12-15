//
//  ButtonFormView.swift
//  UIKit-Chat
//
//  Created by Kalabishka Ivan on 03.12.2021.
//

import UIKit

class ButtonFormView: UIView {

    init(label: UILabel, button: UIButton) {
        super.init(frame: .zero)
        self.addSubview(label)
        self.addSubview(button)

        self.translatesAutoresizingMaskIntoConstraints = false // благодаря этому мы можем настраивать констрейнты
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false

        // задаем границы для label
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])

        // задаем границы для button
        NSLayoutConstraint.activate([
            // верхняя граница кнопки привязана к нижней границе кнопки
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor), // левая граница
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor), // правая граница 
            button.heightAnchor.constraint(equalToConstant: 60) // высота кнопки
        ])

        bottomAnchor.constraint(equalTo: button.bottomAnchor).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// ПОЧИТАТЬ
// translatesAutoresizingMaskIntoConstraints
// Anchor
