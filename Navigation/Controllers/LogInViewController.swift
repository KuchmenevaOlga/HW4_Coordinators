//
//  LogInViewController.swift
//  Navigation
//
//  Created by Ольга Кучменева on 18.10.2020.
//  Copyright © 2020 Olga Kuchmeneva. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    weak var coordinator: MainCoordinator?
    let profileViewController: UIViewController = ProfileViewController()
    
    private let contentView: UIView = {
        let view = UIView()
        view.toAutoLayout()
        return view
    }()
    
    private let logoView: UIImageView = {
        let logo = UIImageView()
        logo.image = #imageLiteral(resourceName: "logo")
        logo.toAutoLayout()
        return logo
    }()
    
    private let doubleContainer: UIView = {
        let container = UIView()
        container.layer.borderColor = UIColor.lightGray.cgColor
        container.layer.borderWidth = 0.5
        container.layer.cornerRadius = 10
        container.backgroundColor = .systemGray6
        container.toAutoLayout()
        return container
    }()
    
    private let nameContainer: UIView = {
        let container = UIView()
        container.toAutoLayout()
        container.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        container.layer.cornerRadius = 10
        container.layer.borderColor = UIColor.lightGray.cgColor
        container.layer.borderWidth = 0.25
        return container
    }()
    
    private let passwordContainer: UIView = {
        let container = UIView()
        container.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        container.layer.cornerRadius = 10
        container.layer.borderColor = UIColor.lightGray.cgColor
        container.layer.borderWidth = 0.25
        container.toAutoLayout()
        return container
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.tintColor = UIColor(named: "mainColor")
        textField.placeholder = "Email or phone"
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.autocapitalizationType = .none
        textField.toAutoLayout()
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.tintColor = UIColor(named: "mainColor")
        textField.placeholder = "Password"
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.isSecureTextEntry = true
        textField.toAutoLayout()
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Log In", for: .normal)
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel"), for: .normal)
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(0.8), for: .selected)
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(0.8), for: .highlighted)
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(0.8), for: .disabled)
        button.addTarget(self, action: #selector(login), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.toAutoLayout()
        return button
       }()

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.toAutoLayout()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        setupLayout()
        
        /// Keyboard observers
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
          
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
          
    // MARK: Keyboard actions
    @objc fileprivate func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                
        scrollView.contentInset.bottom = keyboardSize.height
        scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
          
    @objc fileprivate func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }

    
    func setupLayout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        contentView.addSubview(logoView)
        contentView.addSubview(doubleContainer)
        contentView.addSubview(loginButton)
        doubleContainer.addSubview(nameContainer)
        doubleContainer.addSubview(passwordContainer)
        nameContainer.addSubview(nameTextField)
        passwordContainer.addSubview(passwordTextField)
        
        let constraints = [
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            
            logoView.widthAnchor.constraint(equalToConstant: 100),
            logoView.heightAnchor.constraint(equalToConstant: 100),
            logoView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            
            doubleContainer.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 120),
            doubleContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            doubleContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            doubleContainer.heightAnchor.constraint(equalToConstant: 100),
            
            nameContainer.topAnchor.constraint(equalTo: doubleContainer.topAnchor, constant: 0),
            nameContainer.leadingAnchor.constraint(equalTo: doubleContainer.leadingAnchor, constant: 0),
            nameContainer.trailingAnchor.constraint(equalTo: doubleContainer.trailingAnchor, constant: 0),
            nameContainer.heightAnchor.constraint(equalToConstant: 50),
            
            passwordContainer.bottomAnchor.constraint(equalTo: doubleContainer.bottomAnchor, constant: 0),
            passwordContainer.leadingAnchor.constraint(equalTo: doubleContainer.leadingAnchor, constant: 0),
            passwordContainer.trailingAnchor.constraint(equalTo: doubleContainer.trailingAnchor, constant: 0),
            passwordContainer.heightAnchor.constraint(equalToConstant: 50),
            
            nameTextField.centerYAnchor.constraint(equalTo: nameContainer.centerYAnchor),
            nameTextField.leadingAnchor.constraint(equalTo: nameContainer.leadingAnchor, constant: 16),
            nameTextField.trailingAnchor.constraint(equalTo: nameContainer.trailingAnchor, constant: 16),
    
            passwordTextField.centerYAnchor.constraint(equalTo: passwordContainer.centerYAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordContainer.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordContainer.trailingAnchor, constant: 16),
            
            loginButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.topAnchor.constraint(equalTo: doubleContainer.bottomAnchor, constant: 16)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc func login() {
        coordinator?.openProfile()
    }
}

