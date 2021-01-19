//
//  FindPWViewController.swift
//  TripDiary
//
//  Created by 김민순 on 2021/01/11.
//

import UIKit

class FindPWViewController: UIViewController {
    @IBOutlet weak var userIdTextField: HSUnderLineTextField!
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var emptyIdLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goButton.layer.cornerRadius = 14
        title = "비밀번호 찾기"
        emptyIdLabel.text = ""
    }

    @IBAction func findPasswordPressed(_ sender: UIButton) {
        if userIdTextField.text == "" {
            userIdTextField.attributedPlaceholder = NSAttributedString(string: "UserID", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.9764705882, green: 0.03529411765, blue: 0.03529411765, alpha: 1)]) 
            userIdTextField.lineColor = #colorLiteral(red: 0.9764705882, green: 0.03529411765, blue: 0.03529411765, alpha: 1)
            emptyIdLabel.text = "아이디를 입력하세요"
        }
    }
}
