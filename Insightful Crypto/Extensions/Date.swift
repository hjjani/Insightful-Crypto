//
//  Date.swift
//  Insightful Crypto
//
//  Created by Hitanshu Jani on 3/17/25.
//
// Extending date to be used in coin graphs.

import Foundation

extension Date {
    
    // 2025-01-20T09:11:54.494Z
    init(coinGeckoString: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = formatter.date(from: coinGeckoString) ?? Date()
        self.init(timeInterval: 0, since: date)
    }
    
    private var shortFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
    
    func asShortDateString() -> String {
        return shortFormatter.string(from: self)
    }
    
}
