//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Nithish on 17/05/25.
//




// Z stack - on top
// H stack - you know this
// V stack -
// let - immutable
// var - mutable
// Struct - imutable
// Use property wrapper to modify the elements in the struct - use the @State property annotation
// Whenever using the image - the image will be the covering the maximum screen and it will be very big -  so we use the resizabel modifier and ignore safe area modifier to beautify it
// Use the environment property wrapper to set the values to listen to them globally from anywhere
// Order of modifiers matters - each modifier applied will be to the previous state of the widget


import SwiftUI

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    
    var body: some View {
        ZStack{
            // Background image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                // Prancing pony img
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                
                //Currency exchange text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                // Conversion section
                HStack{
                    //Left conversion section
                    VStack{
                        //Curency
                        HStack{
                            // Currecny image
                            Image(.silverpenny)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            // Currency text
                            Text("Silver Piece")
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, -5)
                        
                        //Text field
                        TextField("Amount",
                                  text: $leftAmount)
                        .textFieldStyle(.roundedBorder)
                    }
                    
                    // Equal sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    
                    // Right conversion section
                    
                    VStack{
                        //Curency
                        HStack{
                            // Currecny text
                                Text("Gold Piece")
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            // Currency image
                            Image(.goldpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        
                        //Text field
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                
                Spacer()
                
                // Info Button
                HStack {
                    Spacer()
                    Button{
                        showExchangeInfo.toggle()
                    }label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)
                    
                }
                .padding(.bottom,-5)
                
            }
        }
        .sheet(isPresented: $showExchangeInfo){
                ExchangeInfo()
        }
    }
}

#Preview {
    ContentView()
}
