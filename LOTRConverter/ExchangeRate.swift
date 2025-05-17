//
//  ExchangeRate.swift
//  LOTRConverter
//
//  Created by Nithish on 17/05/25.
//

import SwiftUI


struct ExchangeRate: View {
    let leftImage: ImageResource
    let text: String
    let rightImage: ImageResource
    
    
    var body: some View {
        HStack{
            // LEft currency image
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
            // Exchange rate text
            Text(text)
            
            // Right currency image
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
        }
    }
}


#Preview {
    ExchangeRate(leftImage: .silverpiece, text: "One silver Piece = 4 Silver Pennies", rightImage: .silverpenny)
}
