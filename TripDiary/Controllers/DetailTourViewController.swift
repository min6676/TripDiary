//
//  DetailTourViewController.swift
//  TripDiary
//
//  Created by 김민순 on 2021/01/17.
//

import UIKit

class DetailTourViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = "상세 투어내역"
        self.tabBarController?.navigationItem.hidesBackButton = true
    }


}
