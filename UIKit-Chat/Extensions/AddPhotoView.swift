//
//  AddPhotoView.swift
//  UIKit-Chat
//
//  Created by Kalabishka Ivan on 16.12.2021.
//

import UIKit

class AddPhotoView: UIView {
    
    var circleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "aratar")
        //        imageView.image = UIImage(systemName: "person.circle")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 1
        return imageView
    }()
    
    let plusButtom: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        //        let myImage = UIImage(systemName: "plus.circle.fill")
        
        
        let myImage = #imageLiteral(resourceName: "plus")
        
        
        button.setImage(myImage, for: .normal)
        button.tintColor = .buttonDark()
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(circleImageView)
        addSubview(plusButtom)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            circleImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            circleImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            circleImageView.widthAnchor.constraint(equalToConstant: 100),
            circleImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            plusButtom.leadingAnchor.constraint(equalTo: circleImageView.trailingAnchor, constant: 16),
            plusButtom.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            plusButtom.widthAnchor.constraint(equalToConstant: 30),
            plusButtom.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        self.bottomAnchor.constraint(equalTo: circleImageView.bottomAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: plusButtom.trailingAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init ...")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        circleImageView.layer.masksToBounds = true
        circleImageView.layer.cornerRadius = circleImageView.frame.width / 2 // округление зависит от ширины изображения
    }
}
