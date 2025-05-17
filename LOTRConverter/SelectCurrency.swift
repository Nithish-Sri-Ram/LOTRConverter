//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Nithish on 17/05/25.
//

import SwiftUI


struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack{
            // Parchment Bg img
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack{
                // Text
                Text("Select the Currency you are starting with:")
                    .fontWeight(.bold)
                
                
                // Currency Icons
                CurrencyIcon(currencyImage: .copperpenny, currencyName: "Copper Penny")
                
                
                // Text
                Text("Select the Currency you would like to convert to:")
                    .fontWeight(.bold)
                
                // Currency icons
                
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
            .padding()
            .multilineTextAlignment(.center)
        }
    }
}


#Preview {
    SelectCurrency()
}
