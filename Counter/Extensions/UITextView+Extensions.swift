//
//  UITextView+Extensions.swift
//  Counter
//
//  Created by Sergey Ivanov on 14.11.2023.
//

import Foundation
import UIKit

extension UITextView {
    func scrollToBottom() {
        guard text.count > 0 else { return }
        let location = text.count - 1
        let bottom = NSMakeRange(location, 1)
        scrollRangeToVisible(bottom)
    }
}
