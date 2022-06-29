//
//  Event.swift
//  StreamingApp
//
//  Created by Kuda Zata on 24/6/2022.
//

import Foundation

struct Event: Codable {
    var id: String?
    var title: String?
    var subtitle: String?
    var date: Date?
    var imageUrl: String?
    var videoUrl: String?
}

//group all views in one folder
