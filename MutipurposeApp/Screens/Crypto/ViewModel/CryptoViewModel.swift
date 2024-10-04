//
//  CryptoViewModel.swift
//  MutipurposeApp
//
//  Created by Sandeep on 27/09/24.
//

import Foundation

class CryptoViewModel: ObservableObject {
    @Published var cryptoError: String = ""
    @Published var allCoin: [CoinModel] = []
    
    func fetchCoinList(){
        let url =  "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h"
        
        APIManager.shared.requestGET(url: url) { result, error in
            guard let json = result else {
                self.cryptoError = error ?? Constant.SOMETHING_WRONG
                return
            }
            
            do {
                self.allCoin = try JSONDecoder().decode([CoinModel].self, from: json)
            }catch{
                self.cryptoError = Constant.FAILED_PARSE
            }
        }
    }
}
