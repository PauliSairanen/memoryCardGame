//
//  Card.swift
//  Consentration
//
//  Created by Pauli Sairanen on 22.5.2018.
//  Copyright © 2018 Pauli Sairanen. All rights reserved.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int
    {
        identifierFactory += 1
        return identifierFactory
    }
    
    
    //----- Initializers -----
    
    init()
    {
        self.identifier = Card.getUniqueIdentifier()
    }
}
