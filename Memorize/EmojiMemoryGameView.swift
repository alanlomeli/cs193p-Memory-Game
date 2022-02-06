//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Alan Lomeli on 05/12/21.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    @State var themeColor: Color = Color.red
    
    var body: some View {
        AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
            if card.isMatched && !card.isFaceUp {
                Rectangle().opacity(0)
            } else {
                CardView(card:card)
                    .padding(4)
                    .onTapGesture {
                        game.choose(card)
                    }
            }
        }
        .foregroundColor(themeColor)
        .padding(.horizontal)
    }
}

struct CardView : View {
    let card: MemoryGame<String>.Card
    var body : some View {
        GeometryReader { geometry in
    ZStack {
        let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
        if card.isFaceUp {
            shape.fill().foregroundColor(.white)
            shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
            Pie(startAngle: Angle(degrees: 0-90),  endAngle: Angle(degrees:360-90))
                .padding(5).opacity(0.5)
            Text(card.content).font(Memorize.font(in: geometry.size))
        } else if card.isMatched {
            shape.opacity(0)
        } else {
            shape.fill()
        }
    }
        }
    }
}

private func font(in size: CGSize) -> Font {
    Font.system(size: min(size.width,size.height) * DrawingConstants.fontScale)
}

private struct DrawingConstants {
    static let cornerRadius: CGFloat = 10
    static let lineWidth: CGFloat = 3
    static let fontScale: CGFloat = 0.7
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
    let game = EmojiMemoryGame()
        game.choose(game.cards[0])
            return EmojiMemoryGameView(game: game).preferredColorScheme(.light)
    }
}
