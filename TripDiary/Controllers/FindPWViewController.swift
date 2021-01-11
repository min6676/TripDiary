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

        // Do any additional setup after loading the view.
        setUI()
    }
    
    func setUI() {
        
        goButton.layer.cornerRadius = 14
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        let fontColor = #colorLiteral(red: 0.9764705882, green: 0.9725490196, blue: 0.9725490196, alpha: 1)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationItem.title = "회원가입"
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: fontColor, NSAttributedString.Key.font: UIFont(name: "NanumSquareOTF_acB", size: 26)!]
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
