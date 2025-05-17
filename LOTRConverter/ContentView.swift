//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Nithish on 17/05/25.
//


// For copying a file (option + Drag with mouse) of the file to be replicated

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
// Function argument label names and parameter names - the parameter names are the default function argument labels, else we can explicitely define the labels for the parameters
// FocusState - to let us know on where in our app or where in our screen we are currently focused
// The sheet is not connected to the button itself, but it listens to the showExchange info listener and as the value change the sheet comes up
// Similar to the sheet - the on changed modifier also doesn't necessarily listens to the typing field to listen, we can have it at the bottom with the sheet modifier too, but I like it the way it is organized to the button
// to use the inbuild swift sf icons - use the systemName. as a prefix and get going
// The task modifier allows the code to run in the background when the screen appears
// bigmountainstudio.com - has good notes and books on swift

import SwiftUI
import TipKit

struct ContentView: View {
    @State var showExchangeInfo = false
    
    @State var showSelectedCurrency = false
    
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    @State var leftCurrency = Currency.silverPiece
    @State var rightCurrency: Currency = .goldPiece
    
    let currencyTip = CurrencyTip()
    
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
                                .onChange(of: leftCurrency) {
                                    leftAmount =
                                    rightCurrency.convert(rightAmount, to: leftCurrency)
                                }
                            
                            // Currency text
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectedCurrency.toggle()
                            currencyTip.invalidate(reason:
                                    .actionPerformed)
                        }
                        .popoverTip(currencyTip, arrowEdge: .bottom)
                        
                        //Text field
                        TextField("Amount",
                                  text: $leftAmount)
                        .textFieldStyle(.roundedBorder)
                        .focused($leftTyping)
                        .onChange(of: leftAmount) {
                            if leftTyping == true {
                                rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
                            }
                        }
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
                                .onChange(of: rightCurrency) {
                                    rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
                                }
                            
                            // Currency image
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectedCurrency.toggle()
                            currencyTip.invalidate(reason:
                                    .actionPerformed)
                        }
                        
                        //Text field
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($rightTyping)   // Only do the conversion if right typing is true
                            .multilineTextAlignment(.trailing)
                            .onChange(of: rightAmount) {
                                if rightTyping == true {
                                    leftAmount =
                                    rightCurrency.convert(rightAmount, to: leftCurrency)
                                }
                            }
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                .keyboardType(.decimalPad)
                
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
        .task {
            try? Tips.configure()
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
