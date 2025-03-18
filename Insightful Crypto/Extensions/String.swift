//
//  String.swift
//  Insightful Crypto
//
//  Created by Hitanshu Jani on 3/17/25.
//
// Formats text for coin descriptions on a coin page by removing HTML occurrences.

import Foundation

extension String {
    
    var removingHTMLOccurrences: String {
        return self.replacingOccurrences(of: "<[^>}+>", with: "", options: .regularExpression, range: nil)
    }
    
}
