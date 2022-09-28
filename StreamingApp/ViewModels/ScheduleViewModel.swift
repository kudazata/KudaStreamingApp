//
//  ScheduleViewModel.swift
//  StreamingApp
//
//  Created by Kuda Zata on 27/9/2022.
//

import Foundation

struct ScheduleViewModel {
    
    init(_ schedule: Schedule) {
        self.schedule = schedule
    }
    
    private var schedule: Schedule
    
    var title: String {
        return schedule.title
    }
    
    var subtitle: String {
        return schedule.subtitle
    }
    
    var date: String {
        return DateFormatter.relativeDateFormatter.string(from: schedule.date)
    }
    
    var imageUrl: String {
        return schedule.imageUrl
    }
}
