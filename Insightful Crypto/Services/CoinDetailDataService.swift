//
//  CoinDetailDataService.swift
//  Insightful Crypto
//
//  Created by Hitanshu Jani on 3/17/25.
//
// CoinDetailDataService is responsible for fetching detailed data for a specific coin.
// It uses Combine to handle the asynchronous fetching and publishing of the coin's details.

import Foundation

import Foundation
import Combine

class CoinDetailDataService {

    // Published property to store the detailed information of the coin.
    @Published var coinDetails: CoinDetailModel? = nil

    // Cancellable to store the subscription for the coin details request.
    var coinDetailSubscription: AnyCancellable?

    // A reference to the CoinModel that we need to fetch details for.
    let coin: CoinModel
    
    init(coin: CoinModel) {
        self.coin = coin
        getCoinDetails()
    }

    // Function to fetch coin details using the CoinGecko API
    func getCoinDetails() {

        // Construct the URL for the specific coin's detailed data
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/\(coin.id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false")
        else { return } // Return if the URL is invalid

        // Use the NetworkingManager to perform the download and decode the response into a CoinDetailModel
        coinDetailSubscription = NetworkingManager.download(url: url)
            .decode(type: CoinDetailModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main) // Ensure UI updates happen on the main thread
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedCoinDetails) in
                // Store the fetched coin details into the published variable
                self?.coinDetails = returnedCoinDetails
                // Cancel the subscription once we have the data
                self?.coinDetailSubscription?.cancel()
            })
    }
    
}
