//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Alan Lomeli on 19/01/22.
//

import Foundation

class EmojiMemoryGame: ObservableObject{
    typealias Card = MemoryGame<String>.Card
    static let emojis = ["🚘","🚂","🚌","✈️","🚲","🚐","🚃","🚠","🚢","🛶","🛺","🦼","🚑","🚜","🏎"]
    
   @Published private var model = createMemoryGame()
    
    private static func createMemoryGame() ->  MemoryGame<String> {
        MemoryGame<String>(numberOfPairOfCards: 10) { pairIndex in
            emojis[pairIndex]
        }
    }
    var cards: Array<Card> {
        return model.cards
    }
    // MARK: Intent(s)
    //choose could be something complicated instruction, modify db, go through etc
     func choose(_ card: Card){
        model.choose(card)
    }
}
