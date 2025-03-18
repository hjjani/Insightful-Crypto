//
//  CoinDataService.swift
//  Insightful Crypto
//
//  Created by Hitanshu Jani on 2/18/25.
//
// CoinDataService is responsible for fetching a list of coins from the CoinGecko API
// It uses Combine to manage asynchronous data fetching and publishing the result.

import Foundation
import Combine

class CoinDataService {

    // Published variable to hold the list of coins. Any view observing this property will update automatically.
    @Published var allCoins: [CoinModel] = []

    // Cancellable to store the subscription to the network request. It will be used to cancel the request when it's done.
    var coinSubscription: AnyCancellable?
    
    init() {
        getCoins()
    }

    // Function to make the API call and retrieve the list of coins
    func getCoins() {
        
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h")
        else { return } // Return if the URL is invalid

        // Calling the NetworkingManager to perform the download, then decoding the response into an array of CoinModel
        coinSubscription = NetworkingManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main) // Ensure UI updates happen on the main thread
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedCoins) in
                // Assign the fetched coins to the published variable
                self?.allCoins = returnedCoins
                // Cancel the subscription as we don't need it anymore
                self?.coinSubscription?.cancel()
            })
    }
    
}
