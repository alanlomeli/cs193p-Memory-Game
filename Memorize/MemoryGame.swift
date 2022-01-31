//
//  MemoryGame.swift
//  Memorize
//
//  Created by Alan Lomeli on 19/01/22.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfSelectedCard: Int? {
        get { cards.indices.filter ({ index in cards[index].isFaceUp}).oneAndOnly }
        set { cards.indices.forEach { index in cards[index].isFaceUp = (index == newValue) } }
    }
    
    mutating func choose(_ card: Card){
        if let cardIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[cardIndex].isFaceUp,
           !cards[cardIndex].isMatched
        {
            if let potentialMatchIndex = indexOfSelectedCard {
                if cards[cardIndex].content == cards[potentialMatchIndex].content {
                    cards[cardIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                cards[cardIndex].isFaceUp = true
            } else {
                indexOfSelectedCard = cardIndex
            }
        }

    }
    
    init(numberOfPairOfCards:Int, createCardContent:(Int)->CardContent){
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content:content,id:pairIndex*2))
            cards.append(Card(content:content,id:pairIndex*2+1))
        }
    }
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        let id: Int
    }
}
extension Array {
    var oneAndOnly: Element? {
        if count == 1 {
            return first
        } else {
            return nil
        }
    }
}
