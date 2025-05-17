//
//  Currency.swift
//  LOTRConverter
//
//  Created by Nithish on 17/05/25.
//

import SwiftUI

enum Currency: Double, CaseIterable, Identifiable {
    case copperPenny = 1
    case silverPenny = 4
    case silverPiece = 16
    case goldPenny = 64
    case goldPiece = 6400
    
    var id: Currency {  self  }
    
    var image: ImageResource {
        switch self {
            case .copperPenny:
                return .copperpenny
            case .silverPenny:
                return .silverpenny
            case .silverPiece:
                return .silverpiece
            case .goldPenny:
                return .goldpenny
            case .goldPiece:
                return .goldpiece
        }
    }
    
    var name: String {
        switch self {
        case .copperPenny:
            return "Copper Penny"
            
        case .silverPenny:
            return "Silver Penny"
            
        case .silverPiece:
            return "Silver Piece"
            
        case .goldPenny:
            return "Gold Penny"
            
        case .goldPiece:
            return "Gold Piece" 
        }
    }
    
    func convert(_ amountString: String,to currency: Currency)-> String{
        guard let doubleAmount = Double(amountString) else {
            return ""
        }
        
        let convertedAmount = (doubleAmount * self.rawValue) / currency.rawValue
        
        return String(format: "%.2f", convertedAmount)
    }
}
