//
//  Extensions.swift
//  StreamingApp
//
//  Created by Kuda Zata on 29/6/2022.
//

import Foundation
import UIKit
import SVProgressHUD

extension DateFormatter {
    static let relativeDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.doesRelativeDateFormatting = true
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
}

extension UIViewController {
    func showProgressHUD() {
        
        //Customizing SVProgressHUD
        view.endEditing(true)
        SVProgressHUD.setRingThickness(6)
        SVProgressHUD.setDefaultMaskType(.black)
        SVProgressHUD.setForegroundColor(UIColor.white)
        SVProgressHUD.setBackgroundColor(.clear)
        SVProgressHUD.show()
    }
}
