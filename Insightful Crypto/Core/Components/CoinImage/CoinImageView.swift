//
//  CoinImageView.swift
//  Insightful Crypto
//
//  Created by Hitanshu Jani on 2/23/25.
//
//  SwiftUI view to display a coin image (downloaded from API or fallback).
//  Uses MVVM: CoinImageViewModel handles the image loading via Combine.

import SwiftUI

struct CoinImageView: View {
    
    @StateObject var vm: CoinImageViewModel // ViewModel to manage image loading state

    // Custom init to inject a coin and initialize the StateObject
    init(coin: CoinModel) {
        _vm = StateObject(wrappedValue: CoinImageViewModel(coin: coin))
    }
    
    var body: some View {
        ZStack {
            // Show image if available
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            // Show loading spinner while fetching image
            } else if vm.isLoading {
                ProgressView()
            // Fallback image if loading fails
            } else {
                Image(systemName: "questionmark")
                    .foregroundColor(Color.theme.secondaryText)
            }
        }
    }
}

struct CoinImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoinImageView(coin: dev.coin)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
