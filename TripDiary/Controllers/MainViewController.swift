//
//  ViewController.swift
//  TripDiary
//
//  Created by 김민순 on 2021/01/08.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var joinButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loginButton.layer.cornerRadius = 15
        joinButton.layer.cornerRadius = 15
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToLogin", sender: self)
    }
    
    @IBAction func joinButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToJoin", sender: self)
    }

}

