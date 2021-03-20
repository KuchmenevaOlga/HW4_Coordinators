//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Ольга Кучменева on 07.10.2020.
//  Copyright © 2020 Olga Kuchmeneva. All rights reserved.
//

import Foundation
import UIKit

class ProfileHeaderView: UIView {
    var statusText: String = ""
      
    private let profileView: UIView = {
        let view = UIView()
        view.toAutoLayout()
        return view
    }()
    
    var timerLabel: UILabel = {
        let view = UILabel()
        view.toAutoLayout()
        view.textColor = .darkGray
        view.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return view
    }()
    
    var avatarImageView: UIImageView = {
        let view = UIImageView(image: #imageLiteral(resourceName: "cat"))
        view.layer.cornerRadius = 48
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.white.cgColor
        view.clipsToBounds = true
        view.isUserInteractionEnabled = true
        view.alpha = 1
        view.toAutoLayout()
        return view
    }()
    private let fullNameLabel: UILabel = {
        let view = UILabel()
        view.toAutoLayout()
        view.textColor = .black
        view.text = "Angry cat"
        view.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return view
    }()
    private let statusLabel: UILabel = {
        let view = UILabel()
        view.textColor = .gray
        view.text = "Waiting for something..."
        view.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        view.toAutoLayout()
        return view
    }()
    private let statusTextField: UITextField = {
        let view = UITextField()
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.backgroundColor = .white
        view.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        view.toAutoLayout()
        return view
    }()
    private let setStatusButton: UIButton = {
        let view = UIButton()
        view.layer.cornerRadius = 4
        view.backgroundColor = .blue
        view.setTitle("Set status", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 4.0
        view.layer.shadowOpacity = 0.7
        view.toAutoLayout()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    setStatusButton.addTarget(self, action: #selector(pressedButton), for: .touchUpInside)
    statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        
    setupLayout()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func pressedButton() {
        statusLabel.text = statusText
    }
    
    @objc func statusTextChanged(_ textField: UITextField){
        statusText = textField.text ?? ""
    }
    
    func setupLayout() {
        addSubview(profileView)
       
        profileView.addSubview(avatarImageView)
        profileView.addSubview(timerLabel)
        profileView.addSubview(fullNameLabel)
        profileView.addSubview(statusLabel)
        profileView.addSubview(statusTextField)
        profileView.addSubview(setStatusButton)
        
        let constraints = [
            profileView.topAnchor.constraint(equalTo: topAnchor),
            profileView.leadingAnchor.constraint(equalTo: leadingAnchor),
            profileView.trailingAnchor.constraint(equalTo: trailingAnchor),
            profileView.bottomAnchor.constraint(equalTo: bottomAnchor),
            profileView.heightAnchor.constraint(equalToConstant: 220),
            
            avatarImageView.topAnchor.constraint(equalTo: profileView.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: profileView.leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 96),
            
            fullNameLabel.topAnchor.constraint(equalTo: profileView.topAnchor, constant: 27),
            fullNameLabel.trailingAnchor.constraint(equalTo: profileView.trailingAnchor, constant: -16),
            fullNameLabel.leadingAnchor.constraint(equalTo: profileView.leadingAnchor, constant:  16+96+16),
            
            timerLabel.topAnchor.constraint(equalTo: profileView.topAnchor, constant: 7),
            timerLabel.trailingAnchor.constraint(equalTo: profileView.trailingAnchor, constant: -16),
            timerLabel.leadingAnchor.constraint(equalTo: profileView.leadingAnchor, constant:  16+96+16),
            
            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 16),
            statusLabel.centerXAnchor.constraint(equalTo: fullNameLabel.centerXAnchor),
            statusLabel.widthAnchor.constraint(equalTo: fullNameLabel.widthAnchor),

            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 16),
            statusTextField.centerXAnchor.constraint(equalTo: statusLabel.centerXAnchor),
            statusTextField.widthAnchor.constraint(equalTo: statusLabel.widthAnchor),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),

            setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 16),
            setStatusButton.leadingAnchor.constraint(equalTo: profileView.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: profileView.trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ]
        

            NSLayoutConstraint.activate(constraints)
        
    }
}
