//
//  HomeStatsView.swift
//  Insightful Crypto
//
//  Created by Hitanshu Jani on 2/24/25.
//
// Displays the market statistics (market cap, 24h volume, etc) for the app.

import SwiftUI

struct HomeStatsView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @Binding var showPortfolio: Bool // State binding to toggle portfolio view
    
    var body: some View {
        HStack {
            // Loop over statistics and display each one
            ForEach(vm.statistics) { stat in
                StatisticView(stat: stat)
                    .frame(width: UIScreen.main.bounds.width / 3)
            }
        }
        .frame(width: UIScreen.main.bounds.width, alignment: showPortfolio ? .trailing : .leading)
    }
}

struct HomeStatsView_Previews: PreviewProvider {
    static var previews: some View {
        HomeStatsView(showPortfolio: .constant(false))
            .environmentObject(dev.homeVM)
    }
}
