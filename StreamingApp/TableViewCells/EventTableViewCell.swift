//
//  EventTableViewCell.swift
//  StreamingApp
//
//  Created by Kuda Zata on 24/6/2022.
//

import UIKit
import Kingfisher

class EventTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var eventImage: UIImageView!
    
    func configureCell(event: Event) {
        titleLabel.text = event.title
        subtitleLabel.text = event.subtitle
        dateLabel.text = formattedDate(date: event.date!)
        let imageUrl = URL(string: event.imageUrl!)
        self.eventImage.kf.setImage(with: imageUrl)
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

    }

}
