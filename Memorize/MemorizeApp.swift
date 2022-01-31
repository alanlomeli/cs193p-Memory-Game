//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Alan Lomeli on 05/12/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
   private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
