//
//  CoinRowView.swift
//  Insightful Crypto
//
//  Created by Hitanshu Jani on 2/8/25.
//
// Lays out the columns and their titles for the pages that display general coin/portfolio coin data.

import SwiftUI

struct CoinRowView: View {
    
    let coin: CoinModel           // Coin model representing the coin's data
    let showHoldingsColumn: Bool  // Flag to toggle visibility of holdings column
    
    var body: some View {
        HStack(spacing: 0) {
            leftColumn
            Spacer()
            if showHoldingsColumn {
                centerColumn
            }
            rightColumn
        }
        .font(.subheadline)
        .background(
            Color.theme.background.opacity(0.001)
        )
        .contentShape(Rectangle())
    }
}

// Preview of CoinRowView for both light and dark modes
struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CoinRowView(coin: dev.coin, showHoldingsColumn: true)
                .previewLayout(.sizeThatFits)
            
            CoinRowView(coin: dev.coin, showHoldingsColumn: true)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}

extension CoinRowView {
    // Left column displaying coin rank, image, and symbol
    private var leftColumn: some View {
        HStack(spacing: 0) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .frame(minWidth: 30)
            CoinImageView(coin: coin)
                .frame(width: 30, height: 30)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundColor(Color.theme.accent)
        }
    }

    // Center column displaying holdings value and amount
    private var centerColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
                .bold()
            Text((coin.currentHoldings ?? 0).asNumberString())
        }
        .foregroundColor(Color.theme.accent)
    }

    // Right column displaying current price and 24H price change
    private var rightColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentPrice.asCurrencyWith6Decimals())
                .bold()
                .foregroundColor(Color.theme.accent)
            Text(coin.priceChangePercentage24H?.asPercentString() ?? "").foregroundColor((coin.priceChangePercentage24H ?? 0) >= 0 ? Color.theme.green : Color.theme.red)
            
        }
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
}
