//
//  DetailTourViewController.swift
//  TripDiary
//
//  Created by 김민순 on 2021/01/17.
//

import UIKit

class DetailTourViewController: UIViewController {
    @IBOutlet weak var tableHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    
    var contents: [Content] = [
        Content(name: "홍천", date: "7/9 - AM 10:00", image: #imageLiteral(resourceName: "홍천")),
        Content(name: "남이섬", date: "7/10 - PM 02:00", image: #imageLiteral(resourceName: "nami_island")),
        Content(name: "여수", date: "7/10 - PM 04:00", image: #imageLiteral(resourceName: "yeosu")),
        Content(name: "영월", date: "7/10 - PM 06:00", image: #imageLiteral(resourceName: "yeongwol"))
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UINib(nibName: K.detialCellNibName, bundle: nil), forCellReuseIdentifier: K.detailCellIdentifier)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = "상세 투어내역"
        self.tabBarController?.navigationItem.hidesBackButton = true
    }
    
    // Dynamic height of TableView
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.layoutIfNeeded()
        tableHeightConstraint.constant = tableView.contentSize.height
        self.view.layoutIfNeeded()
        
    }


}

//MARK: - UITableViewDataSource

extension DetailTourViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.detailCellIdentifier, for: indexPath) as! DetailContentCell
        cell.name.text = contents[indexPath.row].name
        cell.date.text = contents[indexPath.row].date
        cell.bottomImageView.image = contents[indexPath.row].image
        
        return cell
    }
    
    
}
