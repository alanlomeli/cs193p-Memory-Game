//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Alan Lomeli on 19/01/22.
//

import Foundation

class EmojiMemoryGame: ObservableObject{
   static let emojis = ["🚘","🚂","🚌","✈️","🚲","🚐","🚃","🚠","🚢","🛶","🛺","🦼","🚑","🚜","🏎"]
    
   @Published private var model: MemoryGame<String> = createMemoryGame()
    
    static func createMemoryGame() ->  MemoryGame<String> {
        MemoryGame<String>(numberOfPairOfCards: 10) { pairIndex in
            emojis[pairIndex]
        }
    }
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    // MARK: Intent(s)
    //choose could be something complicated instruction, modify db, go through etc
     func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
}
