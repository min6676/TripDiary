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
        loginButton.layer.cornerRadius = 14
        joinButton.layer.cornerRadius = 14
        setUI()
    }
    
    func setUI() {
        
        let fontColor = #colorLiteral(red: 0.9764705882, green: 0.9725490196, blue: 0.9725490196, alpha: 1)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: fontColor, NSAttributedString.Key.font: UIFont(name: "NanumSquareOTF_acB", size: 26)!]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }

}

