//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Alan Lomeli on 19/01/22.
//

import Foundation
import SwiftUI

class EmojiMemoryGame: ObservableObject{

    @Published private var theme: Theme<String>
    @Published private var model: MemoryGame<String>
    
    init(){
        let themeId = Int.random(in: 0..<StaticThemes.themes.count)
        let newTheme = StaticThemes.themes[themeId]
        let newModel =  MemoryGame<String>(numberOfPairOfCards: newTheme.numberOfPairs) { pairIndex in
            StaticThemes.themes[themeId].content[pairIndex]
    }
        theme = newTheme
        model = newModel
    }
    
    func createMemoryGame() {
        let themeId = Int.random(in: 0..<StaticThemes.themes.count)
        let newTheme = StaticThemes.themes[themeId]
        model =  MemoryGame<String>(numberOfPairOfCards: newTheme.numberOfPairs) { pairIndex in
            StaticThemes.themes[themeId].content[pairIndex]
    }
        theme = newTheme
    }

    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    func getThemeColor() -> Color {
        theme.color
    }
    func getThemeName() -> String {
        theme.name
    }
    func getGameScore() -> Int {
        model.score
    }
    
    // MARK: Intent(s)
    //choose could be something complicated instruction, modify db, go through etc
     func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
}
