//
//  ViewController.swift
//  Concentration_2
//
//  Created by Nadav Barsheshet on 6/23/18.
//  Copyright © 2018 Nadav Barsheshet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var flipCount = 0 { // every property can have code as so...
        didSet { // this is called a property observer, it observe everytime the property changes.
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    var emojiChoices = ["👻","🎃","👻","🎃"]
    
    @IBAction func touchCard(_ sender: UIButton) {//if we want to return a value we should add after @IBAction func touchCard(_ sender: UIButton) -> Int, as so.
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            print("card number \(cardNumber)")
        }
        
    }
    
    
    func flipCard(withEmoji emoji: String, on button: UIButton){
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        } else{
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        }
    }
    
    
    
    
}

