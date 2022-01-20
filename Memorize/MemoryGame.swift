//
//  MemoryGame.swift
//  Memorize
//
//  Created by Alan Lomeli on 19/01/22.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(_ card: Card){  //adding blank so we dont sound repetitive with a card type and card name

    }
    init(numberOfPairOfCards:Int, createCardContent:(Int)->CardContent){
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content:content))
        }
    }
    struct Card  {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
