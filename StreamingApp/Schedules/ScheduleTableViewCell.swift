//
//  ScheduleTableViewCell.swift
//  StreamingApp
//
//  Created by Kuda Zata on 27/6/2022.
//

import UIKit
import Kingfisher

class ScheduleTableViewCell: UITableViewCell {

    @IBOutlet weak var scheduleImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func configureCell(schedule: Schedule) {
        titleLabel.text = schedule.title
        subtitleLabel.text = schedule.subtitle
        dateLabel.text = schedule.date
        let imageUrl = URL(string: schedule.imageUrl!)
        self.scheduleImage.kf.setImage(with: imageUrl)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
