//
//  CreateActivityViewController.swift
//  Productivity Tracker
//
//  Created by Matej Butkovic on 09.06.2021..
//

import UIKit

class CreateActivityViewController: UIViewController {
    
    private var presenter: ActivitiesPresenter!
    
    private var titleLabel: UILabel!
    private var activityNameInput: UITextField!
    private var createButton: UIButton!
    
    convenience init(presenter: ActivitiesPresenter) {
        self.init()
        self.presenter = presenter
        title = "Create Activity"
        
    }
    
    @objc func createActivity(_ sender: Any){
        guard let name = activityNameInput.text else {return}
        if (name.count < 1) {return}
        presenter.createActivity(name: name)
        presenter.refreshList()
        self.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildViews()
        addConstraints()
        self.hideKeyboardWhenTappedAround()

    }
    
    private func buildViews(){
        view.backgroundColor = .systemGreen
        titleLabel = UILabel()
        titleLabel.text = "Create a new Activity"
        titleLabel.textColor = .white
        
        activityNameInput = UITextField()
        activityNameInput.backgroundColor = .white
        activityNameInput.layer.cornerRadius = 8
        activityNameInput.textColor = .black
        activityNameInput.autocapitalizationType = .none
        activityNameInput.delegate = self
        
        createButton = UIButton()
        createButton.backgroundColor = .white
        createButton.setTitleColor(.black, for: .normal)
        createButton.setTitle("Create", for: .normal)
        createButton.layer.cornerRadius = 8
        
        createButton.addTarget(self, action: #selector(self.createActivity), for: .touchUpInside)

        
        view.addSubview(titleLabel)
        view.addSubview(activityNameInput)
        view.addSubview(createButton)
        
    }
    private func addConstraints(){
        titleLabel.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(45)
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
        }
        
        activityNameInput.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(45)
            make.top.equalToSuperview().offset(180)
            make.centerX.equalToSuperview()
        }
        
        createButton.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(45)
            make.bottom.equalToSuperview().offset(-80)
            make.centerX.equalToSuperview()
        }
    }

}

extension CreateActivityViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension CreateActivityViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         textField.resignFirstResponder()
        return true
    }
}
