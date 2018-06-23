//
//  ViewController.swift
//  Concentration_2
//
//  Created by Nadav Barsheshet on 6/23/18.
//  Copyright © 2018 Nadav Barsheshet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    lazy var game = Concentration(numberOfPairOfCards: (cardButtons.count + 1 / 2))
    
    var flipCount = 0 { // every property can have code as so...
        didSet { // this is called a property observer, it observe everytime the property changes.
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    
    
    @IBAction func touchCard(_ sender: UIButton) {//if we want to return a
        //value we should add after
        //@IBAction func touchCard(_ sender: UIButton) -> Int, as so.
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            //now we need to update the view that a card had been chosen
            updateViewFromModel()
        } else {
            print("chosen card was not is the array")
        }
        
    }
    
    func updateViewFromModel(){
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ?  #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    var emojiChoices = ["👻","🎃","😈","🍬","🍎","🦇","🙀","🍭","😱"]
    
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil ,emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
    
}

