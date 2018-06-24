//
//  Card.swift
//  Concentration_2
//
//  Created by Nadav Barsheshet on 6/23/18.
//  Copyright © 2018 Nadav Barsheshet. All rights reserved.
//

import Foundation

struct Card {
   
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
