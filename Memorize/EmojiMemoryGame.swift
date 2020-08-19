//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Wang Shaobo on 2020/8/19.
//  Copyright © 2020 Wang Shaobo. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame : ObservableObject {
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻", "🎃", "🕷"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            emojis[pairIndex]
        }
    }

    // MARK: - Access to Model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
