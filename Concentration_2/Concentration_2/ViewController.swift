//
//  ViewController.swift
//  Concentration_2
//
//  Created by Nadav Barsheshet on 6/23/18.
//  Copyright © 2018 Nadav Barsheshet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    private lazy var game = Concentration(numberOfPairOfCards: numberOfPairOfCards)
    
    var numberOfPairOfCards : Int {
        get {
            return (cardButtons.count + 1) / 2
        }
    }
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    @IBOutlet weak var scoreCountLabel: UILabel!
    
    @IBAction func newGame(_ sender: UIButton) {
        game.newGame()
        updateViewFromModel()
    }
    
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBAction private func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            //now we need to update the view that a card had been chosen
            updateViewFromModel()
        } else {
            print("chosen card was not is the array")
        }
        
    }
    
    private func updateViewFromModel(){
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
        flipCountLabel.text = "Flips: \(game.flipCount)"
        scoreCountLabel.text = "Score: \(game.scoreCount)"
        
    }
    
    private var emojiThemes = [
        ["👻","🎃","😈","🍬","🍎","🦇","🙀","🍭","😱"],
        ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐨"],
        ["🐔","🐧","🐦","🐤","🐣","🐥","🦆","🦅","🦉"],
        ["⚽️","🏀","🏈","⚾️","🎾","🏐","🏉","🎱","🏓"],
        ["🚗","🚕","🚙","🚌","🚎","🏎","🚓","🚑","🚒"],
        ["🇨🇦","🇧🇷","🇮🇱","🇮🇹","🇮🇳","🇲🇽","🇦🇺","🇬🇧","🇦🇷"]]
    
    var chosenTheme : Int?
    
    private var emoji = [Int:String]()
    
    private func emoji(for card: Card) -> String {
        if chosenTheme == nil{
          chosenTheme  = emojiThemes.count.arc4random
        }
        if emoji[card.identifier] == nil ,emojiThemes[chosenTheme!].count > 0 {
            emoji[card.identifier] = emojiThemes[chosenTheme!].remove(at: emojiThemes[chosenTheme!].count.arc4random)
        }
        return emoji[card.identifier] ?? "?"
    }
    
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else{
            return 0
        }
    }
}






