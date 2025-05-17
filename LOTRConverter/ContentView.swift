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
// Struct - similar to other programing languages, like a class, can have methods and data members
// Enum - here instead of var or val, we use 'case' - the one set of available values to choose from (Like our own data type)
// Identifiable - a class of types whose instance hold the value of an entity with stable identity
// Use Identifiable - as a stable notion of identity to a class or a value type
// Caseiterable - turnes an enum value into array (or) collection
// Identifiable with CaseIterables - to uniquely identify the array elements or enum elements - here in the 'Currency' class
// Always toggle and see how the theme is working for the dark theme in the application and if you want it to be uniform, click on the v-stack or z-stack, the topmost starting one on the code and add modifier to it- to add the foreground color to be black
 // Binding - A property wrapper type that can read and write a value owned by a source of truth
// Guard - is the exception handling in iOS

import SwiftUI

struct ContentView: View {
    @State var showExchangeInfo = false
    
    @State var showSelectedCurrency = false
    
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    @State var leftCurrency = Currency.silverPiece
    @State var rightCurrency: Currency = .goldPiece
    
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
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            // Currency text
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectedCurrency.toggle()
                        }
                        
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
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            // Currency image
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectedCurrency.toggle()
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
        .sheet(isPresented: $showSelectedCurrency){
            SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
        }
    }
}

#Preview {
    ContentView()
}
