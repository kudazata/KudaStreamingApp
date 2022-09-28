//
//  Event.swift
//  StreamingApp
//
//  Created by Kuda Zata on 24/6/2022.
//

import Foundation

struct Event: Decodable {
    let id: String
    let title: String
    let subtitle: String
    let date: Date
    let imageUrl: String
    let videoUrl: String
}
