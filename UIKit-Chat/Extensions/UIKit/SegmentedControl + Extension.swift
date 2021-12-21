//
//  SegmentedControl + Extension.swift
//  UIKit-Chat
//
//  Created by Kalabishka Ivan on 21.12.2021.
//

import UIKit

extension UISegmentedControl {
    
    convenience init(first: String, second: String) {
        self.init()
        self.insertSegment(withTitle: first, at: 0, animated: true)
        self.insertSegment(withTitle: second, at: 1, animated: true)
        self.selectedSegmentIndex = 0
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
