//
//  CoinModel.swift
//  Insightful Crypto
//
//  Created by Hitanshu Jani on 2/5/25.
//

// CoinGecko API Info
/*
 URL: https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h
 
 JSON Repsponse:
 {
     "id": "bitcoin",
     "symbol": "btc",
     "name": "Bitcoin",
     "image": "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
     "current_price": 96709,
     "market_cap": 1917582987601,
     "market_cap_rank": 1,
     "fully_diluted_valuation": 1917582987601,
     "total_volume": 55051363594,
     "high_24h": 100760,
     "low_24h": 96026,
     "price_change_24h": -2942.528260752253,
     "price_change_percentage_24h": -2.95281,
     "market_cap_change_24h": -56318505771.083496,
     "market_cap_change_percentage_24h": -2.85316,
     "circulating_supply": 19820084,
     "total_supply": 19820084,
     "max_supply": 21000000,
     "ath": 108786,
     "ath_change_percentage": -11.06401,
     "ath_date": "2025-01-20T09:11:54.494Z",
     "atl": 67.81,
     "atl_change_percentage": 142579.42077,
     "atl_date": "2013-07-06T00:00:00.000Z",
     "roi": null,
     "last_updated": "2025-02-05T19:01:50.835Z",
     "sparkline_in_7d": {
       "price": [
         102542.84134196813,
         102910.23934445361,
         103621.21550924935,
         104302.57891352312,
         103725.06679541634,
         103505.30962657207,
         103715.7684209174,
         104106.091328276,
         104062.16245379577,
         104621.97745138497,
         105178.04867984517,
         105402.31611817043,
         105125.3428552742,
         105192.17716115106,
         105162.28920688407,
         105068.55618632458,
         105300.60344458018,
         105314.44377232197,
         105294.1238143463,
         105033.27812610562,
         104869.32058130573,
         105892.90682330292,
         105700.60377366941,
         105684.10403389746,
         105320.05136169468,
         105611.5739729221,
         105790.75505709808,
         105188.81506348633,
         105031.3530846565,
         105121.06862147224,
         104719.69018312056,
         104859.2039947492,
         104736.87599130778,
         104322.18868785404,
         104325.00174294008,
         103991.35346005936,
         104285.77813469055,
         104506.3300564099,
         104217.79035004404,
         104030.89604475061,
         104310.04406200137,
         104274.53389246491,
         104740.66194955219,
         104668.68597425931,
         104614.28446002454,
         104475.41308585052,
         105480.45394517481,
         105071.25945425681,
         104623.76134295262,
         102524.21520732481,
         102310.35586633568,
         101598.16372711949,
         101921.93619140107,
         102231.1283769451,
         102404.93376107872,
         102470.38402887621,
         102512.46698695565,
         102403.77977300351,
         102249.72937645671,
         102293.87636307711,
         102475.68101584575,
         102392.6088536625,
         102185.38756205894,
         101992.51177679887,
         101615.24850144365,
         101592.66990862337,
         102019.51548371714,
         102149.95154515926,
         101860.22271648972,
         101823.14984091595,
         102108.3490479744,
         101882.43146116784,
         102239.73795237648,
         101992.1932854985,
         101476.28084876582,
         101341.21144517073,
         101393.69478953844,
         100522.89746094769,
         100503.92993660411,
         101237.55570873898,
         101161.8529126038,
         100488.42869471373,
         99092.333588406,
         99511.03304807426,
         100272.9911974196,
         100355.30821794734,
         99593.13977161376,
         99794.68350624843,
         99645.40771022183,
         99342.03532242186,
         98933.28243566968,
         98201.26569873706,
         98791.6437249441,
         99259.48949920906,
         99306.8359207168,
         98196.81871091944,
         97157.76217158206,
         96896.82676418213,
         98235.87175043522,
         97793.53821562871,
         96988.74415938454,
         97815.84535257479,
         97652.02866142086,
         96653.10505164102,
         93517.87531879066,
         93529.88153166145,
         94068.23649713039,
         92876.12162304203,
         93885.07988775491,
         93984.49582240354,
         95437.74841070815,
         95431.53785259378,
         95373.35106292863,
         95770.80181571534,
         95184.99000103062,
         94848.74372319518,
         94721.98536030206,
         96874.2426135226,
         99175.4839366473,
         98664.16766125984,
         99427.091812037,
         100109.60169399311,
         102038.29415299969,
         101776.9704902056,
         102011.13759922635,
         101786.57409375272,
         101392.3150300614,
         101177.50269250017,
         101468.37868950945,
         100843.17354271388,
         100696.1326357584,
         100163.72562649935,
         99248.39363079518,
         99414.93416195072,
         98461.65323336356,
         98361.85276813261,
         98707.16429232086,
         98900.15664785431,
         99125.47947716463,
         99369.05940581522,
         99132.60917545018,
         100160.09279025279,
         99503.28222371545,
         99207.7117070122,
         99243.8917964687,
         99359.35824162222,
         98860.42539595038,
         97972.8075370943,
         96386.5143187413,
         97690.61739242118,
         97888.30731950274,
         98360.40524167611,
         97742.4722066188,
         98029.77668903438,
         98006.5293424413,
         98094.7373713875,
         98200.71650096471,
         97513.92279729006,
         97904.93450676241,
         97656.24528073946,
         97450.19613346204,
         97759.8831753512,
         98193.32303841642,
         98045.78183003876,
         98611.46674060835,
         98351.26868548083,
         98192.99346867306,
         98044.92329209218
       ]
     },
     "price_change_percentage_24h_in_currency": -2.952814381431904
   },
 */
import Foundation

struct CoinModel: Identifiable, Codable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCap, marketCapRank, fullyDilutedValuation: Double?
    let totalVolume, high24H, low24H: Double?
    let priceChange24H, priceChangePercentage24H, marketCapChange24H, marketCapChangePercentage24H: Double?
    let circulatingSupply, totalSupply, maxSupply, ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D?
    let priceChangePercentage24HInCurrency: Double?
    let currentHoldings: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case sparklineIn7D = "sparkline_in_7d"
        case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
        case currentHoldings
    }
    
    func updateHoldings(amount: Double) -> CoinModel {
        return CoinModel(id: id, symbol: symbol, name: name, image: image, currentPrice: currentPrice, marketCap: marketCap, marketCapRank: marketCapRank, fullyDilutedValuation: fullyDilutedValuation, totalVolume: totalVolume, high24H: high24H, low24H: low24H, priceChange24H: priceChange24H, priceChangePercentage24H: priceChangePercentage24H, marketCapChange24H: marketCapChange24H, marketCapChangePercentage24H: marketCapChangePercentage24H, circulatingSupply: circulatingSupply, totalSupply: totalSupply, maxSupply: maxSupply, ath: ath, athChangePercentage: athChangePercentage, athDate: athDate, atl: atl, atlChangePercentage: atlChangePercentage, atlDate: atlDate, lastUpdated: lastUpdated, sparklineIn7D: sparklineIn7D, priceChangePercentage24HInCurrency: priceChangePercentage24HInCurrency, currentHoldings: amount)
    }
    
    var currentHoldingsValue: Double {
        return (currentHoldings ?? 0) * currentPrice
    }
    
    var rank: Int {
        return Int(marketCapRank ?? 0)
    }
}

struct SparklineIn7D: Codable {
    let price: [Double]?
}

