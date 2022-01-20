//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Alan Lomeli on 19/01/22.
//

import Foundation

class EmojiMemoryGame {
   static let emojis = ["🚘","🚂","🚌","✈️","🚲","🚐","🚃","🚠","🚢","🛶","🛺","🦼","🚑","🚜","🏎"]
    
    private var model: MemoryGame<String> = createMemoryGame()
    
    static func createMemoryGame() ->  MemoryGame<String> {
        MemoryGame<String>(numberOfPairOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
