//
//  HapticManager.swift
//  Insightful Crypto
//
//  Created by Hitanshu Jani on 3/17/25.
//

import Foundation
import SwiftUI

class HapticManager {
    
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
    
}
