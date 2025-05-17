//
//  ExchangeInfo.swift
//  LOTRConverter
//
//  Created by Nithish on 17/05/25.
//

import SwiftUI

struct ExchangeInfo: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            // Background parchment image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack{
                // Title
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .tracking(3)
                
                
                // Description
                Text("Here at the Prancing Pony, we offer a wide range of exchange rates to suit your needs. We used to take Brandy Bucks, but we've moved on to the digital realm. So, if you're looking to exchange your Brandy Bucks for something else, just let us know! Below is a simple guide to our exchange rates: ")
                    .font(.title3)
                    .padding()
                
                // Exchange rates
                ExchangeRate(leftImage: .goldpiece, text: "One Gold Piece = 4 Gold Pennies", rightImage: .goldpenny)
                
                ExchangeRate(leftImage: .goldpenny, text: "One Gold Penny = 4 Silver Pices", rightImage: .silverpiece)
                
                ExchangeRate(leftImage: .silverpiece, text: "One silver Piece = 4 Silver Pennies", rightImage: .silverpenny)
                
                ExchangeRate(leftImage: .silverpenny, text: "One silver Penny = 100 Copper Pennies", rightImage: .copperpenny)
                
                
                // Done Button
                Button("Done"){
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
            }
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    ExchangeInfo()
}
