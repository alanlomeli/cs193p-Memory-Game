//
//  ContentView.swift
//  Memorize
//
//  Created by Alan Lomeli on 05/12/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    @State var eMOJIS = ["🚘","🚂","🚌","✈️","🚲","🚐","🚃","🚠","🚢","🛶","🛺","🦼","🚑","🚜","🏎"]
    let tecMojis = ["⌚️","📱","💻","⌨️","🖨","💿","📷","🕹","💾","🖥","📺","📻","📟","🎞"]
    let blueMojis = ["🐬","🐳","🌐","🇺🇳","💎","🧊","🌊","🌎","❄️","💙","🇫🇲","🔵","🚾","🌀"]
    let natureMojis = ["🌿","🌹","🍎","🌻","🌸","🌳","🐢","🐣","🦎","🦚","🍁","🌧","☀️","🐇"]
    @State var themeColor: Color = Color.red
    @State var numberOfCardsShown = 4;
    var body: some View {
    VStack {
        Text("Memorize!").font(.title)
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum:65))]) {
                ForEach(viewModel.cards){ card in
                    CardView(card: card)
                        .aspectRatio(2/3,contentMode:.fit)
                        .onTapGesture(){
                            viewModel.choose(card)
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
/*
    var technologyThemeButton: some View {
        Button {
            themeColor = colorFromHex(hex: 0x757C88)
            numberOfCardsShown = Int.random(in: 3..<tecMojis.count)
            emojis = tecMojis
            emojis.shuffle()
        } label: {
            VStack {
                Image(systemName: "pc" )
                Text("Technology").font(.title3)
            }
            .foregroundColor(colorFromHex(hex: 0x757C88))
                  }
        }
    var blueThemeButton: some View {
        Button {
            themeColor = colorFromHex(hex: 0x63C5DA)
            numberOfCardsShown = Int.random(in: 3..<blueMojis.count)
            emojis = blueMojis
            emojis.shuffle()
        } label: {
            VStack {
                Image(systemName: "drop" )
                Text("Blue").font(.title3)
            }
            .foregroundColor(colorFromHex(hex: 0x63C5DA))
                  }
        }
    var natureThemeButton: some View {
        Button {
            themeColor = colorFromHex(hex: 0x74B72E)
            numberOfCardsShown = Int.random(in: 3..<natureMojis.count)
            emojis = natureMojis
            emojis.shuffle()
        } label: {
            VStack {
                Image(systemName: "tortoise" )
                Text("Nature").font(.title3)
            }
            .foregroundColor(colorFromHex(hex: 0x74B72E))
                  }
        }
 */
    func colorFromHex(hex:Int) -> Color{
        return Color(red: Double((hex & 0xFF0000) >> 16) / 255.0,
                     green: Double((hex & 0x00FF00) >> 8) / 255.0,
                     blue: Double(hex & 0x0000FF) / 255.0
                     )
    }
    }

struct CardView : View {
    let card: MemoryGame<String>.Card
    var body : some View {
    ZStack {
        let shape = RoundedRectangle(cornerRadius: 20)
        if card.isFaceUp {
            shape.fill().foregroundColor(.white)
            shape.strokeBorder(lineWidth: 3)
            Text(card.content).font(.largeTitle)
        } else if card.isMatched {
            shape.opacity(0)
        } else {
            shape.fill()
        }
    }
    }
}
struct ThemeButton : View {
    var themeName: String
    var themeIcon: String
    var themeColorHex: Int
    var body : some View {
        
        Button (action :{
            
        }, label:{
        })
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
    let game = EmojiMemoryGame()
            ContentView(viewModel: game).preferredColorScheme(.light)
    }
}
