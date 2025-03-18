//
//  DetailViewModel.swift
//  Insightful Crypto
//
//  Created by Hitanshu Jani on 3/17/25.
//
//  ViewModel for the Coin Detail screen.
// All data retrieved from CoinGecko API.
//  Follows MVVM architecture and uses Combine to bind coin data and additional metadata (description, links, statistics).

import Foundation
import Combine

class DetailViewModel: ObservableObject {

    // MARK: - Published properties to bind with UI
    @Published var overviewStatistics: [StatisticModel] = []    // Summary stats (price, market cap, rank, volume)
    @Published var additionalStatistics: [StatisticModel] = []  // Extra info (24h high/low, block time, hashing algo)
    @Published var coinDescription: String? = nil               // Coin's description from CoinGecko API
    @Published var websiteURL: String? = nil                    // Official homepage URL
    @Published var redditURL: String? = nil                     // Coin's subreddit URL
    
    @Published var coin: CoinModel                              // Main coin model passed into detail view
    
    private let coinDetailService: CoinDetailDataService        // Fetches extra coin data from CoinGecko API
    private var cancellables = Set<AnyCancellable>()            // Holds Combine subscriptions
    
    init(coin: CoinModel) {
        self.coin = coin
        self.coinDetailService = CoinDetailDataService(coin: coin)
        self.addSubscribers()
    }

    // MARK: - Subscribe to detail service and transform data
    private func addSubscribers() {

        // Combine CoinModel and CoinDetailModel to compute statistics arrays
        coinDetailService.$coinDetails
            .combineLatest($coin)
            .map(mapDataToStatistics)
            .sink { [weak self] (returnedArrays) in
                self?.overviewStatistics = returnedArrays.overview
                self?.additionalStatistics = returnedArrays.additional
            }
            .store(in: &cancellables)

        // Extract textual info and links from CoinDetailModel
        coinDetailService.$coinDetails
            .sink { [weak self] (returnedCoinDetails) in
                self?.coinDescription = returnedCoinDetails?.readableDescription
                self?.websiteURL = returnedCoinDetails?.links?.homepage?.first
                self?.redditURL = returnedCoinDetails?.links?.subredditURL
            }
            .store(in: &cancellables)
        
    }

    // MARK: - Data transformation for UI display
    private func mapDataToStatistics(coinDetailModel: CoinDetailModel?, coinModel: CoinModel) -> (overview: [StatisticModel], additional: [StatisticModel]) {
        let overviewArray = createOverviewArray(coinModel: coinModel)
        let additionalArray = createAdditionalArray(coinModel: coinModel, coinDetailModel: coinDetailModel)
        return (overviewArray, additionalArray)
    }

    // MARK: - Overview section stats (price, market cap, etc.)
    private func createOverviewArray(coinModel: CoinModel) -> [StatisticModel] {
        // overview
        let price = coinModel.currentPrice.asCurrencyWith6Decimals()
        let pricePercentChange = coinModel.priceChangePercentage24H
        let priceStat = StatisticModel(title: "Current Price", value: price, percentageChange: pricePercentChange)
        
        let marketCap = "$" + (coinModel.marketCap?.formattedWithAbbreviations() ?? "")
        let marketCapPercentChange = coinModel.marketCapChangePercentage24H
        let marketCapStat = StatisticModel(title: "Market Capitalization", value: marketCap, percentageChange: marketCapPercentChange)
        
        let rank = "\(coinModel.rank)"
        let rankStat = StatisticModel(title: "Rank", value: rank)
        
        let volume = "$" + (coinModel.totalVolume?.formattedWithAbbreviations() ?? "")
        let volumeStat = StatisticModel(title: "Volume", value: volume)
        
        let overviewArray: [StatisticModel] = [
            priceStat, marketCapStat, rankStat, volumeStat
        ]
        
        return overviewArray
    }

    // MARK: - Additional section stats (technical info, 24h metrics)
    private func createAdditionalArray(coinModel: CoinModel, coinDetailModel: CoinDetailModel?) -> [StatisticModel] {
        // additional
        let high = coinModel.high24H?.asCurrencyWith6Decimals() ?? "n/a"
        let highStat = StatisticModel(title: "24h High", value: high)
        
        let low = coinModel.low24H?.asCurrencyWith6Decimals() ?? "n/a"
        let lowStat = StatisticModel(title: "24h Low", value: low)
        
        let priceChange = coinModel.priceChangePercentage24H?.asCurrencyWith6Decimals() ?? "n/a"
        let pricePercentChange = coinModel.priceChangePercentage24H
        let priceChangeStat = StatisticModel(title: "24h Price Change", value: priceChange, percentageChange: pricePercentChange)
        
        let marketCapChange = "$" + (coinModel.marketCapChange24H?.formattedWithAbbreviations() ?? "")
        let marketCapPercentChange = coinModel.marketCapChangePercentage24H
        let marketCapChangeStat = StatisticModel(title: "24h Market Cap Change", value: marketCapChange, percentageChange: marketCapPercentChange)
        
        let blockTime = coinDetailModel?.blockTimeInMinutes ?? 0
        let blockTimeString = blockTime == 0 ? "n/a" : "\(blockTime)"
        let blockStat = StatisticModel(title: "Block Time", value: blockTimeString)
        
        let hashing = coinDetailModel?.hashingAlgorithm ?? "n/a"
        let hashingStat = StatisticModel(title: "Hashing Algorithm", value: hashing)
        
        let additionalArray: [StatisticModel] = [
            highStat, lowStat, priceChangeStat, marketCapChangeStat, blockStat, hashingStat
        ]
        
        return additionalArray
    }
    
}
