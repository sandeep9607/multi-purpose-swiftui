//
//  CoinRowView.swift
//  MutipurposeApp
//
//  Created by Sandeep on 27/09/24.
//

import SwiftUI

struct CoinRowView: View {
    let coin : CoinModel
    
    var body: some View {
        HStack(spacing: 0) {
            leftColumn
            Spacer()
            
            centerColumn
            Spacer()
            
            rightColumn
        }
    }
}

#Preview {
    CoinRowView(coin: devCoin)
}

extension CoinRowView{
    
    func symbol(url: String) -> some View{
        AsyncImage(url: URL(string: url),transaction: .init(animation: .default)) { result in
            switch result{
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
            default:
                ProgressView()
            }
        }
    }
    
    private var leftColumn: some View{
        HStack(spacing: 0) {
            Text("\(coin.rank)")
                .font(.caption)
            symbol(url: coin.image ?? "")
                .font(.headline)
                .frame(width: 30,height: 30)
                .padding(.horizontal, 6)
            Text(coin.symbol!.uppercased())
                .font(.headline)
                .foregroundStyle(Color.theme1.accent)
        }
    }
    
    private var centerColumn: some View{
        VStack(alignment: .trailing,spacing: 0) {
            Text(coin.currentHoldingValue.asCurrencyWith6Decimal())
            Text((coin.currentHolding ?? 0).description)
        }
    }
    
    private var rightColumn: some View{
        VStack(alignment: .trailing,spacing: 0){
            Text("\(coin.currentPrice!.description)")
                .bold()
                .foregroundStyle(Color.theme1.accent)
            Text(coin.priceChangePercentage24H?.description ?? "")
                .foregroundStyle(coin.priceChangePercentage24H ?? 0 >= 0 ?
                                 Color.theme1.green : Color.theme1.red)
        }
        .frame(width: UIScreen.main.bounds.width / 3.5,alignment: .trailing)
    }
}
