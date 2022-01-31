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
    VStack {
        Text("Memorize!").font(.title)
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum:100))]) {
                ForEach(game.cards){ card in
                    CardView(card: card)
                        .aspectRatio(2/3,contentMode:.fit)
                        .onTapGesture(){
                            game.choose(card)
                        }
                }
            }
        }
        .foregroundColor(themeColor)
        Spacer()
        HStack {
            //technologyThemeButton
            Spacer()
            //blueThemeButton
            Spacer()
            //natureThemeButton
        }.font(.largeTitle)
        .padding(.horizontal)
    }
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
    static let cornerRadius: CGFloat = 20
    static let lineWidth: CGFloat = 3
    static let fontScale: CGFloat = 0.8
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
    let game = EmojiMemoryGame()
            EmojiMemoryGameView(game: game).preferredColorScheme(.light)
    }
}
