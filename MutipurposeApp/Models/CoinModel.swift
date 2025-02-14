//
//  CoinModel.swift
//  MutipurposeApp
//
//  Created by Sandeep on 27/09/24.
//

import Foundation

// MARK: - CoinModel
struct CoinModel: Identifiable, Codable {
    let id, symbol, name: String?
    let image: String?
    let currentPrice: Double?
    let marketCap, marketCapRank, fullyDilutedValuation, totalVolume: Double?
    let high24H, low24H, priceChange24H, priceChangePercentage24H: Double?
    let marketCapChange24H, marketCapChangePercentage24H: Double?
    let circulatingSupply, totalSupply, maxSupply: Double?
    let ath, athChangePercentage: Decimal?
    let athDate: String?
    let atl, atlChangePercentage: Decimal?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D?
    let priceChangePercentage24HInCurrency: Decimal?
    let currentHolding: Double?
    
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
        case currentHolding
    }
    
    func updateHoldings(amount: Double) -> CoinModel {
        return CoinModel(id: id, symbol: symbol, name: name, image: image, currentPrice: currentPrice, marketCap: marketCap, marketCapRank: marketCapRank, fullyDilutedValuation: fullyDilutedValuation, totalVolume: totalVolume, high24H: high24H, low24H: low24H, priceChange24H: priceChange24H, priceChangePercentage24H: priceChangePercentage24H, marketCapChange24H: marketCapChange24H, marketCapChangePercentage24H: marketCapChangePercentage24H, circulatingSupply: circulatingSupply, totalSupply: totalSupply, maxSupply: maxSupply, ath: ath, athChangePercentage: athChangePercentage, athDate: athDate, atl: atl, atlChangePercentage: atlChangePercentage, atlDate: atlDate, lastUpdated: lastUpdated, sparklineIn7D: sparklineIn7D, priceChangePercentage24HInCurrency: priceChangePercentage24HInCurrency, currentHolding: amount)
    }
    
    var currentHoldingValue: Double{
        return (currentHolding ?? 0) * (currentPrice ?? 0)
    }
    
    var rank: Int{
        return Int(marketCapRank ?? 0)
    }
}

// MARK: - Roi
struct Roi: Codable {
    let times: Decimal?
    let currency: String?
    let percentage: Decimal?
}

// MARK: - SparklineIn7D
struct SparklineIn7D: Codable {
    let price: [Double]?
}

let devCoin = CoinModel(
    id: "bitcoin",
    symbol: "btc",
    name: "Bitcoin",
    image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
    currentPrice: 61408,
    marketCap: 1141731099010,
    marketCapRank: 1,
    fullyDilutedValuation: 1285385611303,
    totalVolume: 67190952980,
    high24H: 61712,
    low24H: 56220,
    priceChange24H: 3952.64,
    priceChangePercentage24H: 6.87944,
    marketCapChange24H: 72110681879,
    marketCapChangePercentage24H: 6.74171,
    circulatingSupply: 18653043,
    totalSupply: 21000000,
    maxSupply: 21000000,
    ath: 61712,
    athChangePercentage: -0.97589,
    athDate: "2021-03-13T20:49:26.606Z",
    atl: 67.81,
    atlChangePercentage: 90020.24075,
    atlDate: "2013-07-06T00:00:00.000Z",
    lastUpdated: "2021-03-13T23:18:10.268Z",
    sparklineIn7D: SparklineIn7D(price: [
        54019.26878317463,
        53718.060935791524,
        53677.12968669343,
        53848.3814432924,
        53561.593235320615,
        
    ]),
    priceChangePercentage24HInCurrency: 3952.64,
    currentHolding: 1.5)
