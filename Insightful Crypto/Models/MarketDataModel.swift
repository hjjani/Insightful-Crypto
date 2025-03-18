//
//  MarketDataModel.swift
//  Insightful Crypto
//
//  Created by Hitanshu Jani on 3/12/25.
//

// CoinGecko Global API Info
/*

This API call provides global market data for cryptocurrencies, including the total market cap, the number of active cryptocurrencies, and other statistics.
It returns data in various currencies (USD, BTC, ETH, etc.).

 URL: https://api.coingecko.com/api/v3/global
 
 
 JSON Response:
 {
   "data": {
     "active_cryptocurrencies": 17167,
     "upcoming_icos": 0,
     "ongoing_icos": 49,
     "ended_icos": 3376,
     "markets": 1282,
     "total_market_cap": {
       "btc": 33775670.93200153,
       "eth": 1476827313.211368,
       "ltc": 30479483557.521797,
       "bch": 8312205734.107531,
       "bnb": 4567862402.960518,
       "eos": 5814153184072.692,
       "xrp": 1205847551953.2063,
       "xlm": 10441941428773.268,
       "link": 206339811326.16138,
       "dot": 636623058218.3568,
       "yfi": 565559435.3318615,
       "usd": 2810231595091.702,
       "aed": 10321025170029.49,
       "ars": 3000085412288656.5,
       "aud": 4434818049519.429,
       "bdt": 340649773891336.6,
       "bhd": 1056939343840.3695,
       "bmd": 2810231595091.702,
       "brl": 16153773254906.12,
       "cad": 4038451744421.3135,
       "chf": 2484284073303.396,
       "clp": 2613374871855528.5,
       "cny": 20341299354752.266,
       "czk": 64578897236679.71,
       "dkk": 19259115700493.188,
       "eur": 2581366333987.434,
       "gbp": 2171488435380.119,
       "gel": 7794177328986.834,
       "hkd": 21840782729261.3,
       "huf": 1031021685070087.1,
       "idr": 45885461484657300,
       "ils": 10248760064561.709,
       "inr": 244294388040064,
       "jpy": 417694557789062.5,
       "krw": 4071770653938958,
       "kwd": 864345741933.9498,
       "lkr": 830989869440136.2,
       "mmk": 5895865886502390,
       "mxn": 55964933197930.695,
       "myr": 12477428282207.16,
       "ngn": 4326688768435085.5,
       "nok": 29872315029001.18,
       "nzd": 4877227189071.525,
       "php": 160815494598427.88,
       "pkr": 785360141840863.8,
       "pln": 10798500379425.143,
       "rub": 240067184280326.75,
       "sar": 10539492574231.918,
       "sek": 28450888647277.414,
       "sgd": 3744372248921.3467,
       "thb": 94564293174835.78,
       "try": 103073112398454.42,
       "twd": 92588705983949.5,
       "uah": 116300490325054.14,
       "vef": 281388489616.53217,
       "vnd": 71698755922619940,
       "zar": 51110272168567.76,
       "xdr": 2098959168142.3972,
       "xag": 82995749995.11316,
       "xau": 939404217.607254,
       "bits": 33775670932001.53,
       "sats": 3377567093200153
     },
     "total_volume": {
       "btc": 873358.6042311843,
       "eth": 38187245.59323913,
       "ltc": 788127029.9878277,
       "bch": 214933891.69493556,
       "bnb": 118114069.16538468,
       "eos": 150340187759.73172,
       "xrp": 31180352775.51286,
       "xlm": 270003796817.4502,
       "link": 5335457287.582685,
       "dot": 16461559761.946194,
       "yfi": 14624023.31090987,
       "usd": 72665912348.47221,
       "aed": 266877189645.7399,
       "ars": 77575080996192.34,
       "aud": 114673858279.3869,
       "bdt": 8808393818626.537,
       "bhd": 27329940297.90979,
       "bmd": 72665912348.47221,
       "brl": 417698197361.48785,
       "cad": 104424767338.10896,
       "chf": 64237683838.8223,
       "clp": 67575665188461.734,
       "cny": 525977673351.94635,
       "czk": 1669856852494.9033,
       "dkk": 497994975163.4102,
       "eur": 66748000446.81264,
       "gbp": 56149531798.96326,
       "gel": 201538907898.4876,
       "hkd": 564750750862.8442,
       "huf": 26659771218689.293,
       "idr": 1186489016825853.8,
       "ils": 265008585709.699,
       "inr": 6316872466862.888,
       "jpy": 10800588883046.645,
       "krw": 105286315177363.42,
       "kwd": 22349927326.931942,
       "lkr": 21487423712932.406,
       "mmk": 152453084107094.66,
       "mxn": 1447120207975.6812,
       "myr": 322636650827.2166,
       "ngn": 111877891969954.75,
       "nok": 772427094384.1963,
       "nzd": 126113507528.5822,
       "php": 4158306616143.585,
       "pkr": 20307547366796.17,
       "pln": 279223564149.2195,
       "rub": 6207567020855.98,
       "sar": 272526237671.7101,
       "sek": 735672385254.6896,
       "sgd": 96820570274.49074,
       "thb": 2445207950526.09,
       "try": 2665225799934.7935,
       "twd": 2394123959476.9385,
       "uah": 3007254366794.973,
       "vef": 7276037803.452522,
       "vnd": 1853959482367000.8,
       "zar": 1321590207723.2573,
       "xdr": 54274097267.161545,
       "xag": 2146072909.0706153,
       "xau": 24290761.179847285,
       "bits": 873358604231.1843,
       "sats": 87335860423118.44
     },
     "market_cap_percentage": {
       "btc": 58.73409306935245,
       "eth": 8.163024678255116,
       "usdt": 5.1423716762815115,
       "xrp": 4.7909811314087065,
       "bnb": 3.1483935817411726,
       "sol": 2.3050750909453863,
       "usdc": 2.104882136071649,
       "ada": 0.9101672537483433,
       "doge": 0.8953313128124345,
       "trx": 0.7223569962886839
     },
     "market_cap_change_percentage_24h_usd": -3.4588786713275046,
     "updated_at": 1742175927
   }
 }
 */
import Foundation

struct GlobalData: Codable {
    let data: MarketDataModel?
}

struct MarketDataModel: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    
    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap: String {
        
        if let item = totalMarketCap.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var volume: String {
        if let item = totalVolume.first(where: { $0.key == "usd"}) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: { $0.key == "btc"}) {
            return item.value.asPercentString()
        }
        return ""
    }
}
