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
    private var sliderLabel: UILabel!
    private var maxSlider: UISlider!
    
    convenience init(presenter: ActivitiesPresenter) {
        self.init()
        self.presenter = presenter
        title = "Create Activity"
        
    }
    
    @objc func createActivity(_ sender: Any){
        guard let name = activityNameInput.text else {return}
        if (name.count < 1) {return}
        presenter.createActivity(name: name, maxGrade: Int(round(maxSlider.value)))
        presenter.refreshList()
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func sliderValueDidChange(_ sender:UISlider!)
    {
        sender.value = round(sender.value)
        sliderLabel.text = "Max score for this activity: \(Int(sender.value))"
        
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
        
        sliderLabel = UILabel()
        sliderLabel.text = "Max score for this activity: 5"
        sliderLabel.textColor = .white
        
        maxSlider = UISlider()
        maxSlider.minimumValue = 1
        maxSlider.maximumValue = 10
        maxSlider.value = 5
        maxSlider.isContinuous = false
        
        maxSlider.addTarget(self, action: #selector(self.sliderValueDidChange(_:)), for: .valueChanged)

        view.addSubview(sliderLabel)
        view.addSubview(maxSlider)
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
        
        sliderLabel.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(45)
            make.top.equalToSuperview().offset(240)
            make.centerX.equalToSuperview()
        }
        
        maxSlider.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(45)
            make.top.equalToSuperview().offset(280)
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
