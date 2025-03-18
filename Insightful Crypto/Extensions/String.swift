//
//  String.swift
//  Insightful Crypto
//
//  Created by Hitanshu Jani on 3/17/25.
//

import Foundation

extension String {
    
    var removingHTMLOccurrences: String {
        return self.replacingOccurrences(of: "<[^>}+>", with: "", options: .regularExpression, range: nil)
    }
    
}
