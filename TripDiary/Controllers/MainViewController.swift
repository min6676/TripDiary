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
        
        setUI()
    }
    
    func setUI() {
        loginButton.layer.cornerRadius = 14
        joinButton.layer.cornerRadius = 14
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
//    @IBAction func loginButtonPressed(_ sender: UIButton) {
//        print("Login Button Pressed")
//        let loginVC = self.storyboard?.instantiateViewController(identifier: "Login") as! LoginViewController
//        self.navigationController?.pushViewController(loginVC, animated: true)
//    }
//    
//    @IBAction func joinButtonPressed(_ sender: UIButton) {
//        print("Join Button Pressed")
//        let joinVC = self.storyboard?.instantiateViewController(identifier: "Join") as! JoinViewController
//        self.navigationController?.pushViewController(joinVC, animated: true)
//    }
    
}

