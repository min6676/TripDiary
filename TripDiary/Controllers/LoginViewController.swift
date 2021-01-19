//
//  LoginViewController.swift
//  TripDiary
//
//  Created by 김민순 on 2021/01/08.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var userIdTextField: HSUnderLineTextField!
    @IBOutlet weak var passwordTextField: HSUnderLineTextField!
    @IBOutlet weak var wrongIdLabel: UILabel!
    @IBOutlet weak var wrongPasswordLabel: UILabel!
    @IBOutlet weak var goButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userIdTextField.delegate = self
        passwordTextField.delegate = self
        
        goButton.layer.cornerRadius = 14
        wrongIdLabel.text = ""
        wrongPasswordLabel.text = ""
        title = "로그인"
        

    }
    

    @IBAction func loginButtonPressed(_ sender: UIButton) {
        guard let id = userIdTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        if id != "" && password != "" {
            let modelLogin = LoginModel(login: id, password: password)
            APIManger.shareInstance.callingLoginAP(login: modelLogin) { (result) in
//                print(result)
                switch result{
                case .success(let json):
                    print(json!)
                    self.performSegue(withIdentifier: K.loginSegue, sender: self)
//                    let id = (json as! ResponseModel).id
    //                print(json as AnyObject)
    //                let id = (json as AnyObject).value(forKey: "id") as! String
    //                let modelLoginResponse = LoginResponseModel(id: id)
    //                print(modelLoginResponse)
                case .failure(let err):
                    self.showAlert(title: "", message: "로그인에 실패했습니다.")
                    self.userIdTextField.attributedPlaceholder = NSAttributedString(string: "UserID", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.9764705882, green: 0.03529411765, blue: 0.03529411765, alpha: 1)])
                    self.passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.9764705882, green: 0.03529411765, blue: 0.03529411765, alpha: 1)])
                    self.userIdTextField.lineColor = #colorLiteral(red: 0.9764705882, green: 0.03529411765, blue: 0.03529411765, alpha: 1)
                    self.passwordTextField.lineColor = #colorLiteral(red: 0.9764705882, green: 0.03529411765, blue: 0.03529411765, alpha: 1)
                    self.wrongIdLabel.text = "올바른 아이디를 입력하세요"
                    self.wrongPasswordLabel.text = "올바른 비밀번호를 입력하세요"
                    print(err.localizedDescription)
                }
            }
        } else {
            self.userIdTextField.attributedPlaceholder = NSAttributedString(string: "UserID", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.9764705882, green: 0.03529411765, blue: 0.03529411765, alpha: 1)])
            self.passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.9764705882, green: 0.03529411765, blue: 0.03529411765, alpha: 1)])
            self.userIdTextField.lineColor = #colorLiteral(red: 0.9764705882, green: 0.03529411765, blue: 0.03529411765, alpha: 1)
            self.passwordTextField.lineColor = #colorLiteral(red: 0.9764705882, green: 0.03529411765, blue: 0.03529411765, alpha: 1)
            self.wrongIdLabel.text = "올바른 아이디를 입력하세요"
            self.wrongPasswordLabel.text = "올바른 비밀번호를 입력하세요"
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

//MARK: - UITextFieldDelegate

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userIdTextField.endEditing(true)
        passwordTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if userIdTextField.text != "" {
            print(userIdTextField.text!)
            return true
        } else {
            print("Type ID")
            return false
        }
    }
}

//MARK: - UnderLineTextField

class HSUnderLineTextField: UITextField , UITextFieldDelegate {
    
    let border = CALayer()
    
    @IBInspectable open var lineColor : UIColor = UIColor.black {
        didSet{
            border.borderColor = lineColor.cgColor
        }
    }
    
    @IBInspectable open var selectedLineColor : UIColor = UIColor.black {
        didSet{
        }
    }
    
    
    @IBInspectable open var lineHeight : CGFloat = CGFloat(1.0) {
        didSet{
            border.frame = CGRect(x: 0, y: self.frame.size.height - lineHeight, width:  self.frame.size.width, height: self.frame.size.height)
        }
    }
    
    required init?(coder aDecoder: (NSCoder?)) {
        super.init(coder: aDecoder!)
        self.delegate=self;
        border.borderColor = lineColor.cgColor
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        
        border.frame = CGRect(x: 0, y: self.frame.size.height - lineHeight, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = lineHeight
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    override func draw(_ rect: CGRect) {
        border.frame = CGRect(x: 0, y: self.frame.size.height - lineHeight, width:  self.frame.size.width, height: self.frame.size.height)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        border.frame = CGRect(x: 0, y: self.frame.size.height - lineHeight, width:  self.frame.size.width, height: self.frame.size.height)
        self.delegate = self
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        border.borderColor = selectedLineColor.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        border.borderColor = lineColor.cgColor
    }
    
}
