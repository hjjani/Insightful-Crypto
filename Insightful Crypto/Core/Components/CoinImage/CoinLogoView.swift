//
//  CoinLogoView.swift
//  Insightful Crypto
//
//  Created by Hitanshu Jani on 3/16/25.
//
//  Combines CoinImageView with coin name and symbol display.
//  Used to show compact logo info for each coin.

import SwiftUI

struct CoinLogoView: View {
    
    let coin: CoinModel // Coin passed in for display
    
    var body: some View {
        VStack {
            CoinImageView(coin: coin) // Coin image from URL
                .frame(width: 50, height: 50)
            Text(coin.symbol.uppercased()) // Coin ticker symbol
                .font(.headline)
                .foregroundColor(Color.theme.accent)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            Text(coin.name) // Full coin name
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .lineLimit(2)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
        }
    }
}

struct CoinLogoView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            CoinLogoView(coin: dev.coin)
                .previewLayout(.sizeThatFits)
            
            CoinLogoView(coin: dev.coin)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
        
    }
}
