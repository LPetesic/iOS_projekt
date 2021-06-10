//
//  LoginView+Design.swift
//  Productivity Tracker
//
//  Created by Antonio Markotic on 10.06.2021..
//

import UIKit
import SnapKit

extension LoginViewController{
    
    func buildViews(){
        loadElements()
        setConstraints()
    }
    
    func loadElements(){

        //gradient background
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.systemGreen.cgColor, UIColor.white.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 4.0, y: 1.0)
        view.layer.insertSublayer(gradientLayer, at: 0)

        
        //Activity tracker label
        activityLabel.alpha = 0
        activityLabel.text = "Activity tracker"
        activityLabel.font = UIFont(name: "Futura", size: 40)
        activityLabel.textAlignment = NSTextAlignment.center

        //emailtextfield
        emailTextField.alpha = 0
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 20))
        emailTextField.leftView = paddingView
        emailTextField.leftViewMode = .always
        emailTextField.backgroundColor =  UIColor(white: 1, alpha: 0.5)
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email")
        emailTextField.textColor = .white
        emailTextField.layer.cornerRadius = 20
        
        //pasword text field
        passwordTextField.alpha = 0
        let paddingView2: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 20))
        passwordTextField.leftView = paddingView2
        passwordTextField.leftViewMode = .always
        passwordTextField.backgroundColor = UIColor(white: 1, alpha: 0.5)
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password")
        passwordTextField.isSecureTextEntry = true
        passwordTextField.layer.cornerRadius = 20
        
        //loginButton
        loginButton.alpha = 0
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        loginButton.setTitleColor(.systemGreen, for: .normal)
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.white.cgColor
        loginButton.layer.cornerRadius = 20
        
    }
    
    func setConstraints(){
        //ActivityTracker label
        view.addSubview(activityLabel)
        activityLabel.snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(50)
            make.centerX.equalTo(view)
        }
        activityLabel.transform = activityLabel.transform.scaledBy(x: 200, y: 200)
        
    
        
        //emailtextfield
        view.addSubview(emailTextField)
        emailTextField.snp.makeConstraints { (make) in
            make.top.equalTo(activityLabel.snp.bottom).offset(70)
            make.centerX.equalTo(view)
            make.size.equalTo(CGSize(width: 250, height: 40))
        }
        emailTextField.transform = emailTextField.transform.translatedBy(x: 0, y: 0)
        
        
        //passwordTextField
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { (make) in
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.centerX.equalTo(view)
            make.size.equalTo(CGSize(width: 250, height: 40))
        }
        passwordTextField.transform = emailTextField.transform.translatedBy(x: 0, y: 0)
        
        
        //loginbutton
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { (make) in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.centerX.equalTo(view)
            make.size.equalTo(CGSize(width: 250, height: 40))
        }
        loginButton.transform = emailTextField.transform.translatedBy(x: 0, y: 0)
    }
}

