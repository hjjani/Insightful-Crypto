//
//  MarketDataService.swift
//  Insightful Crypto
//
//  Created by Hitanshu Jani on 3/12/25.
//
// MarketDataService is responsible for fetching global market data (like total market cap, volume, etc.)
// from the CoinGecko API. It uses Combine to handle asynchronous fetching and publishes the result.

import Foundation
import Combine

class MarketDataService {

    // Published property to hold the market data.
    @Published var marketData: MarketDataModel? = nil

    // Cancellable to store the subscription for the market data request.
    var marketDataSubscription: AnyCancellable?
    
    init() {
        getData()
    }

    // Function to make the API call and fetch the global market data
    func getData() {
        
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else { return }

        // Use NetworkingManager to perform the download and decode the response into GlobalData
        marketDataSubscription = NetworkingManager.download(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main) // Ensure UI updates happen on the main thread
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedGlobalData) in
                // Store the returned global data's 'data' field into the published property
                self?.marketData = returnedGlobalData.data
                // Cancel the subscription once we have the data
                self?.marketDataSubscription?.cancel()
            })
    }
    
}

