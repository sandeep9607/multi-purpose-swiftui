//
//  CryptoHome.swift
//  MutipurposeApp
//
//  Created by Sandeep on 27/09/24.
//

import SwiftUI

struct CryptoHome: View {
    @ObservedObject var cryptoVM = CryptoViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                headerView
                
                Spacer()
                if !cryptoVM.allCoin.isEmpty{
                    List {
                        ForEach(cryptoVM.allCoin) { coin in
                            CoinRowView(coin: coin)
                                .listRowInsets(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                        }
                    }
                    .listStyle(PlainListStyle())
                }
            }
        }
        .onAppear(){
            cryptoVM.fetchCoinList()
        }
    }
}

#Preview {
    CryptoHome()
}

extension CryptoHome{
    private var headerView: some View{
        HStack {
            IconCircleButton(iconName: "info")
            
            Spacer()
            
            Text("Live Prices")
                .font(.headline)
                .fontWeight(.bold)
            
            Spacer()
            
            IconCircleButton(iconName: "chevron.right")
        }.padding(.horizontal, 20)
    }
}

