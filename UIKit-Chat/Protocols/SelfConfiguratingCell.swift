//
//  SelfConfiguratingCell.swift
//  UIKit-Chat
//
//  Created by Kalabishka Ivan on 10.01.2022.
//

import Foundation

protocol SelfConfiguringCell {
    static var reuseID: String { get }
    func configure(with value: MChat)
}
