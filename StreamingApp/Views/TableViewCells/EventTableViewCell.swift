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
    
    func configureCell(eventVM: EventViewModel) {
        titleLabel.text = eventVM.title
        subtitleLabel.text = eventVM.subtitle
        dateLabel.text = eventVM.date
        let imageUrl = URL(string: eventVM.imageUrl)
        self.eventImage.kf.setImage(with: imageUrl)
    }
}
