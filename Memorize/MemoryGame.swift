//
//  MemoryGame.swift
//  Memorize
//
//  Created by Alan Lomeli on 19/01/22.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    var cards: Array<Card>
    private var indexOfSelectedCard: Int?
    var score:Int
    private var seenCards: Set<Int>
    
    mutating func choose(_ card: Card){
        if let cardIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[cardIndex].isFaceUp,
           !cards[cardIndex].isMatched
        {
            if let potentialMatchIndex = indexOfSelectedCard {
                if cards[cardIndex].content == cards[potentialMatchIndex].content {
                    cards[cardIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                } else {
                    if(seenCards.contains(cardIndex)){
                        score -= 1
                    }
                }
                indexOfSelectedCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfSelectedCard = cardIndex
            }
            cards[cardIndex].isFaceUp.toggle()
            seenCards.insert(cardIndex)
        }
    }
    
    init(numberOfPairOfCards:Int,createCardContent:(Int)->CardContent){
        cards = Array<Card>()
        seenCards = Set<Int>()
        score = 0
        for pairIndex in 0..<numberOfPairOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content:content,id:pairIndex*2))
            cards.append(Card(content:content,id:pairIndex*2+1))
        }
        cards.shuffle()
    }
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
