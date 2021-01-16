//
//  FindPWViewController.swift
//  TripDiary
//
//  Created by 김민순 on 2021/01/11.
//

import UIKit

class FindPWViewController: UIViewController {
    @IBOutlet weak var goButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goButton.layer.cornerRadius = 14
        title = "비밀번호 찾기"
    }

}
