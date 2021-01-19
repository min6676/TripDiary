//
//  JoinViewController.swift
//  TripDiary
//
//  Created by 김민순 on 2021/01/09.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var userIdTextField: HSUnderLineTextField!
    @IBOutlet weak var passwordTextField: HSUnderLineTextField!
    @IBOutlet weak var passwordConfirmTextField: HSUnderLineTextField!
    @IBOutlet weak var goButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goButton.layer.cornerRadius = 14
        title = "회원가입"
    }
    
    @IBAction func joinButtonPressed(_ sender: UIButton) {
        if userIdTextField.text != "" && passwordTextField.text != "" && passwordConfirmTextField.text != "" {
            if passwordTextField.text == passwordConfirmTextField.text {
                let register = RegisterModel(id: userIdTextField.text!, password: passwordTextField.text!)
                APIManger.shareInstance.callingRegisterAP(register: register) { (isSuccess, str) in
                    if isSuccess {
                        let modelLogin = LoginModel(login: self.userIdTextField.text!, password: self.passwordTextField.text!)
                        APIManger.shareInstance.callingLoginAP(login: modelLogin) { (result) in
                            print(result)
                        }
                        self.performSegue(withIdentifier: K.registerSegue, sender: self)
                    } else {
                        self.showAlert(title: "", message: str)
                    }
                }
            } else {
                self.showAlert(title: "", message: "비밀번호가 일치하지 않습니다.")
            }
        } else {
            self.showAlert(title: "", message: "모든 항목을 채워주세요.")
        }
 
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let closeAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.cancel) { (UIAlertAction) in
            print("Close")
        }
        alert.addAction(closeAction)
        self.present(alert, animated: true, completion: nil)
    }
 
}

