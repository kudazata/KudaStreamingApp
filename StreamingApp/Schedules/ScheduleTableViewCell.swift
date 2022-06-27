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
    
    func configureCell(schedule: Schedule) {
        titleLabel.text = schedule.title
        subtitleLabel.text = schedule.subtitle
        dateLabel.text = formattedDate(date: schedule.date!)
        let imageUrl = URL(string: schedule.imageUrl!)
        self.scheduleImage.kf.setImage(with: imageUrl)
    }
    
    func formattedDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.doesRelativeDateFormatting = true
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: date)
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
