//
//  Extensions.swift
//  StreamingApp
//
//  Created by Kuda Zata on 29/6/2022.
//

import Foundation
import UIKit

extension DateFormatter {
    static let relativeDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.doesRelativeDateFormatting = true
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
}

