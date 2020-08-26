//
//  MemoryGame.swift
//  Memorize
//
//  Created by Wang Shaobo on 2020/8/17.
//  Copyright © 2020 Wang Shaobo. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfOneAndOnlyFaceUp: Int? {
        get {
            cards.indices.filter{ cards[$0].isFaceUp }.only()
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    mutating func choose(card: Card) {
//        print("card chosen: \(card)")
        
        if let chooseIndex = cards.firstIndex(matching: card), !cards[chooseIndex].isMatched, !cards[chooseIndex].isMatched {
            if let potentialMatchIndex = indexOfOneAndOnlyFaceUp {
                if cards[potentialMatchIndex].content == cards[chooseIndex].content {
                    cards[potentialMatchIndex].isMatched = true
                    cards[chooseIndex].isMatched = true
                }
                cards[chooseIndex].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUp = chooseIndex
            }
        }
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card( content: content, id: pairIndex*2+1))
        }
    }
    
    struct Card : Identifiable{
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
