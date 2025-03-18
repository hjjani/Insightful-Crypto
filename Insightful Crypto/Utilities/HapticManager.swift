//
//  HapticManager.swift
//  Insightful Crypto
//
//  Created by Hitanshu Jani on 3/17/25.
//
// The HapticManager class is responsible for triggering haptic feedback notifications.
// It uses the UINotificationFeedbackGenerator to provide feedback of different types such as success, error, or warning.

import Foundation
import SwiftUI

class HapticManager {

    // Static instance of UINotificationFeedbackGenerator to handle haptic feedback.
    static private let generator = UINotificationFeedbackGenerator()

    // Function to trigger a specific type of notification feedback.
    // - parameter type: The type of notification feedback (success, error, warning).
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
    
}
