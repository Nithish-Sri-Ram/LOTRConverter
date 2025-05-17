//
//  CurrencyTip.swift
//  LOTRConverter
//
//  Created by Nithish on 18/05/25.
//

import TipKit

struct CurrencyTip: Tip {
    var title = Text("Change Currency")
    
    var message: Text? = Text("You can tap the left or right currency to Select or change Currency.")
    
    var image: Image? = Image(systemName: "hand.tap.fill")
    
}
