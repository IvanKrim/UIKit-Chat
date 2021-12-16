//
//  OneLineTextField.swift
//  UIKit-Chat
//
//  Created by Kalabishka Ivan on 15.12.2021.
//

import UIKit

class OneLineTextField: UITextField {
    
    convenience init(font: UIFont? = .arial20()) {
        self.init()
        
        self.font = font
        self.borderStyle = .none //убираем границы у TF
        self.translatesAutoresizingMaskIntoConstraints = false
        
        // настраиваем подчеркивание в TF
        var bottomView = UIView()
        bottomView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        bottomView.backgroundColor = .textFielLight()
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(bottomView)
        
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
