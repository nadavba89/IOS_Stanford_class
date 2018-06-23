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
        for _ in 1...numberOfPairOfCards {
            let card = Card()
            cards += [card,card]
        }
//        var numOfPairsNeedsToShufle = 0;
//        var shuffledCards = [Card?]()
//        
//        while numOfPairsNeedsToShufle != cards.count {
//            let randomIndex = Int(arc4random_uniform(UInt32(cards.count)))
//            if shuffledCards[randomIndex] == nil {
//                shuffledCards[randomIndex] = cards[numOfPairsNeedsToShufle]
//                numOfPairsNeedsToShufle += 1
//            }
//        }
//        
//        for shuffledCrad in shuffledCards{
//            cards[numOfPairsNeedsToShufle] = shuffledCrad!
//            numOfPairsNeedsToShufle -= 1
//        }
        
    }
    
}

//extension MutableCollection {
//    /// Shuffles the contents of this collection.
//    mutating func shuffle() {
//        let c = count
//        guard c > 1 else { return }
//
//        for (firstUnshuffled, unshuffledCount) in
//            zip(indices, stride(from: c, to: 1, by: -1)) {
//                // Change `Int` in the next line to `IndexDistance` in < Swift 4.1
//                let d: Int = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
//                let i = index(firstUnshuffled, offsetBy: d)
//                swapAt(firstUnshuffled, i)
//        }
//    }
//}
//
//extension Sequence {
//    /// Returns an array with the contents of this sequence, shuffled.
//    func shuffled() -> [Element] {
//        var result = Array(self)
//        result.shuffle()
//        return result
//    }
//}

