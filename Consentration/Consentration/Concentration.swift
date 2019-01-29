//
//  Concentration.swift
//  Consentration
//
//  Created by Pauli Sairanen on 22.5.2018.
//  Copyright © 2018 Pauli Sairanen. All rights reserved.
//

import Foundation

//-----  shuffle function for cards -----
extension Array
{
    mutating func shuffle()
    {
        for _ in 0..<10
        {
            sort { (_,_) in arc4random() < arc4random()}
        }
    }
}

//----- Game logic code -----
class Concentration
{
    var cards = [Card]()    // An array of cards
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int)
    {
        if !cards[index].isMatched
        {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index
            {
                // Check if cards match
                if cards[matchIndex].identifier == cards[index].identifier
                {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }
            else
            {
                //either no cards or 2 cards are face up
                for flipDownIndex in cards.indices  // takes all of the indexes that there are
                {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    // Same as constructor in java!!
    // Adds cards to the card collection
    
    init(numberOfPairsOfCards: Int)
    {
        for _ in 1...numberOfPairsOfCards
        {
            let card = Card()
            cards += [card, card]
            cards.shuffle()
        }
    }
}

