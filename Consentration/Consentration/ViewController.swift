//
//  ViewController.swift
//  Consentration
//
//  Created by Pauli Sairanen on 21.5.2018.
//  Copyright © 2018 Pauli Sairanen. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1 ) / 2)
    
    
    //----- Card Flip Counter -----
    var flipCount = 0
    {
        didSet
        {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    //----- Flip Count Label -----
    @IBOutlet weak var flipCountLabel: UILabel!
    
    // This is an Array of cards
    @IBOutlet var cardButtons: [UIButton]!
    
     //----- Starting the game over -----
    @IBAction func startANewGame(_ sender: UIButton)
    {
        startANewGame()
    }
    
    

    //----- Touching a card function-----
    @IBAction func touchCard(_ sender: UIButton)
    {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender)
        {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
        else
        {
            print("Chosen card was not in cardButtons array")
        }
    }
    

    func updateViewFromModel()
    {
        for index in cardButtons.indices
            {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp
                {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                }
            else
                {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
                }
            }
    }
    
    func startANewGame()
    {
        game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1 ) / 2)
        updateViewFromModel()
        flipCount = 0
        emojiChoises = ["🍺", "🍻", "🥂", "🍷", "🥃", "🍸", "🍹", "🍾", "🤢", "🤮"]
    }
    
    func gameEnds()
    {
        
    }
    
    // Mark: - View Controller Life Cycle -
    /*
    override func viewDidLoad() {
        super.viewDidLoad()
        startANewGame()
    }
    
  */
    var emojiChoises = ["🍺", "🍻", "🥂", "🍷", "🥃", "🍸", "🍹", "🍾"]
    var emoji = [Int:String] () // Key-Value -pair
    
    func emoji(for card: Card) -> String
    {
        if emoji[card.identifier] == nil, emojiChoises.count > 0
        {
            let randomIndex = Int (arc4random_uniform(UInt32(emojiChoises.count)))  // Generates a random number using the range of amount of emojis in the list
            emoji[card.identifier] = emojiChoises.remove(at: randomIndex) // Removes one emoji from EmojiChoises and puts it into dictionary
        }
        return emoji[card.identifier] ?? "?"
        
        /*       ---The return statement equals to this---
            if emoji[card.identifier] != nil
                {
                    return emoji[card.identifier]!
                }
                else
                {
                    return "?"
                }
                */
        }
    }

