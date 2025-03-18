//
//  StatisticModel.swift
//  Insightful Crypto
//
//  Created by Hitanshu Jani on 2/24/25.
//
// A data model that represents a statistical metric in the app.
// It includes the title of the metric, its value, and an optional percentage change.

import Foundation

struct StatisticModel: Identifiable {
    
    let id = UUID().uuidString
    let title: String
    let value: String
    let percentageChange: Double?
    
    init(title: String, value: String, percentageChange: Double? = nil) {
        self.title = title
        self.value = value
        self.percentageChange = percentageChange
    }
    
}
