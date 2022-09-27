//
//  EventViewModel.swift
//  StreamingApp
//
//  Created by Kuda Zata on 27/9/2022.
//

import Foundation

struct EventViewModel {
    
    init(event: Event) {
        self.event = event
    }
    
    var event: Event
    
    var title: String {
        return event.title
    }
    var subtitle: String {
        return event.subtitle
    }
    
    var date: String {
        return DateFormatter.relativeDateFormatter.string(from: event.date)
    }
    
    var imageUrl: String {
        return event.imageUrl
    }
    
    var videoUrl: String {
        return event.videoUrl
    }
    
}
