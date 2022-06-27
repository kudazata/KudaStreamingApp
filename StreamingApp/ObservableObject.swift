//
//  ObservableObject.swift
//  StreamingApp
//
//  Created by Kuda Zata on 24/6/2022.
//

import Foundation
import UIKit

class ObservableObject<T> {
    var listener: ((T)->Void)?
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind (_ listener: @escaping (T)->Void) {
        listener(value)
        self.listener = listener
    }
}
