//
//  Concentration.swift
//  Concentration_2
//
//  Created by Nadav Barsheshet on 6/23/18.
//  Copyright © 2018 Nadav Barsheshet. All rights reserved.
//

import Foundation

class Concentration{
    
    
    var cards = [Card]()
    
    var indexOfOneAndOnlyFacedUpCard: Int?
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFacedUpCard, matchIndex != index {
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFacedUpCard = nil
            } else {
                //either no cards or 2 cards are faced up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFacedUpCard = index
            }
        }
    }
    
    
    
    init(numberOfPairOfCards: Int) {
        for _ in 0..<numberOfPairOfCards {
            let card = Card()
            cards += [card,card]
        }
        cards = shuffleCards(cardsToShuffle: cards)
        
    }
    
    func shuffleCards(cardsToShuffle: [Card]) -> [Card]{
        var numOfPairsNeedsToShufle = 0
        var shuffledCards = [Card]()
        var isShuffled = [Bool]()
        for index in 0..<cardsToShuffle.count{
            isShuffled.insert(false, at: index)
        }
        while numOfPairsNeedsToShufle != cardsToShuffle.count {
            let randomIndex = Int(arc4random_uniform(UInt32(cardsToShuffle.count)))
            if !isShuffled[randomIndex]{
                shuffledCards += [cardsToShuffle[randomIndex]]
                isShuffled[randomIndex] = true
                numOfPairsNeedsToShufle += 1
            }
        }
        return shuffledCards
    }
    
}



