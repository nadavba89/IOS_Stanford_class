//
//  Concentration.swift
//  Concentration_2
//
//  Created by Nadav Barsheshet on 6/23/18.
//  Copyright © 2018 Nadav Barsheshet. All rights reserved.
//

import Foundation

class Concentration{
    
    
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFacedUpCard: Int?{
        get{
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set (newValue){
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int){
        assert(cards.indices.contains(index),"Concentration.chooseCard(at: \(index)): chosen index not in the cards")
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFacedUpCard, matchIndex != index {
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                //either no cards or 2 cards are faced up
                indexOfOneAndOnlyFacedUpCard = index
            }
        }
    }
    
    
    
    init(numberOfPairOfCards: Int) {
        assert(numberOfPairOfCards > 0,"Concentration.init( \(numberOfPairOfCards)): you must have at least one pair of cards")
        for _ in 0..<numberOfPairOfCards {
            let card = Card()
            cards += [card,card]
        }
        cards = shuffleCards(cardsToShuffle: cards)
        
    }
    
    private func shuffleCards(cardsToShuffle: [Card]) -> [Card]{
        var numOfPairsNeedsToShufle = 0
        var shuffledCards = [Card]()
        var isShuffled = [Bool]()
        for index in 0..<cardsToShuffle.count{
            isShuffled.insert(false, at: index)
        }
        while numOfPairsNeedsToShufle != cardsToShuffle.count {
            let randomIndex = cardsToShuffle.count.arc4random
            if !isShuffled[randomIndex]{
                shuffledCards += [cardsToShuffle[randomIndex]]
                isShuffled[randomIndex] = true
                numOfPairsNeedsToShufle += 1
            }
        }
        return shuffledCards
    }
    
}



