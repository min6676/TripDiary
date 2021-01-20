//
//  DetailContentCell.swift
//  TripDiary
//
//  Created by 김민순 on 2021/01/20.
//

import UIKit

class DetailContentCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var bottomImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        bottomImageView.layer.cornerRadius = 12
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
