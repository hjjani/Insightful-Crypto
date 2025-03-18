//
//  SearchBarView.swift
//  Insightful Crypto
//
//  Created by Hitanshu Jani on 2/23/25.
//
// Custom SwiftUI search bar that binds to a searchText string.
// Features search icon, dynamic accent color, and clear (X) button.
// Integrates with SwiftUI keyboard and text handling.

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String // Two-way binding for user input
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(
                    searchText.isEmpty ? Color.theme.secondaryText : Color.theme.accent
                )
            
            TextField("Search by name or symbol...", text: $searchText)
                .foregroundColor(Color.theme.accent)
                .keyboardType(.asciiCapable)
                .autocorrectionDisabled(true)
                .overlay(
                    // Clear text button only appear when user has typed something
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10)
                        .foregroundColor(Color.theme.accent)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            UIApplication.shared.endEditing() // dismiss keyboard
                            searchText = ""
                        }
                    
                    
                    
                    
                    , alignment: .trailing
                )
        }
        .font(.headline)
        .padding()
        .background(
            // Rounded background with subtle shadow
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.theme.background)
                .shadow(color: Color.theme.accent.opacity(0.15),
                        radius: 10, x: 0, y: 0)
        )
        .padding()
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SearchBarView(searchText: .constant(""))
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)
            
            SearchBarView(searchText: .constant(""))
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
