//
//  ScheduleTableViewCell.swift
//  StreamingApp
//
//  Created by Kuda Zata on 27/6/2022.
//

import UIKit
import Kingfisher
import Foundation

class ScheduleTableViewCell: UITableViewCell {

    @IBOutlet weak var scheduleImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func configureCell(scheduleVM: ScheduleViewModel) {
        titleLabel.text = scheduleVM.title
        subtitleLabel.text = scheduleVM.subtitle
        dateLabel.text = scheduleVM.date
        let imageUrl = URL(string: scheduleVM.imageUrl)
        self.scheduleImage.kf.setImage(with: imageUrl)
    }

}
