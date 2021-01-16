//
//  JoinViewController.swift
//  TripDiary
//
//  Created by 김민순 on 2021/01/09.
//

import UIKit

class JoinViewController: UIViewController {
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
 
    }
 
}

