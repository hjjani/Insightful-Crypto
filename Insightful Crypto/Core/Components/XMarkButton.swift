//
//  XMarkButton.swift
//  Insightful Crypto
//
//  Created by Hitanshu Jani on 3/16/25.
//
// Simple reusable button component using SwiftUI.
// Uses @Environment dismiss to close views (e.g. sheets).

import SwiftUI

struct XMarkButton: View {
    
    @Environment(\.dismiss) var dismiss // Access SwiftUI's dismiss environment action
    
    var body: some View {
        Button(action: {
            dismiss() // Dismiss current view when tapped
        }, label: {
            Image(systemName: "xmark")
                .font(.headline)
        })
    }
}

struct XMarkButton_Previews: PreviewProvider {
    static var previews: some View {
        XMarkButton()
    }
}
