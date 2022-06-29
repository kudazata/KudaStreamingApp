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
        dateLabel.text = DateFormatter.relativeDateFormatter.string(from: event.date!)
        let imageUrl = URL(string: event.imageUrl!)
        self.eventImage.kf.setImage(with: imageUrl)
    }
}
