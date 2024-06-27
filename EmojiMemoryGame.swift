//
//  EmojiMemoryGame.swift
//  memorize
//
//  Created by Gustavo Gimenez on 26-06-24.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["🐶","🐱","🐭","🦊", "🐻", "🐼", "🐸","🦁", "🐝", "🐷", "🐍","🕷️"]
    
    @Published private var model = MemoryGame(numberOfPairOfCards: 10){ pairIndex in
        if emojis.indices.contains(pairIndex) {
            return emojis[pairIndex]
        }
        return "⁉️"
    }
        
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
