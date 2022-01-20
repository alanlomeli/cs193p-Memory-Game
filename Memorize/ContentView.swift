//
//  ContentView.swift
//  Memorize
//
//  Created by Alan Lomeli on 05/12/21.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = ["🚘","🚂","🚌","✈️","🚲","🚐","🚃","🚠","🚢","🛶","🛺","🦼","🚑","🚜","🏎"]
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
                ForEach(emojis[0..<numberOfCardsShown], id: \.self){ emoji in //this 'emoji' is an argument of the function
                    CardView(content: emoji).aspectRatio(2/3,contentMode:.fit)
                }
            }
        }
        .foregroundColor(themeColor)
        Spacer()
        HStack {
            //deleteCardButton
            //Spacer()
            //addCardButton
            technologyThemeButton
            Spacer()
            blueThemeButton
            Spacer()
            natureThemeButton
        }.font(.largeTitle)
        .padding(.horizontal)
    }
    .padding(.horizontal)
}
    var deleteCardButton: some View {
        Button {
            if numberOfCardsShown > 1 {
                numberOfCardsShown -= 1
            }
        } label: {
                Image(systemName: "minus.circle")
            }
        }
    
    var addCardButton: some View {
        Button {
            if numberOfCardsShown < emojis.count {
                numberOfCardsShown += 1
            }
        } label: {
                Image(systemName: "plus.circle")
            }
        }
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
    func colorFromHex(hex:Int) -> Color{
        return Color(red: Double((hex & 0xFF0000) >> 16) / 255.0,
                     green: Double((hex & 0x00FF00) >> 8) / 255.0,
                     blue: Double(hex & 0x0000FF) / 255.0
                     )
    }
    }

struct CardView : View {
    @State var isFaceUp: Bool = true //state turns the variable into a pointer to a boolean
    var content: String
    var body : some View {
    ZStack {
        let shape = RoundedRectangle(cornerRadius: 20)
        if isFaceUp {
            shape.fill().foregroundColor(.white)
            shape.strokeBorder(lineWidth: 3)
            Text(content).font(.largeTitle)
        } else {
            shape.fill()
        }
    }
    .onTapGesture {
        isFaceUp = !isFaceUp
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
        Group {
            ContentView().preferredColorScheme(.light)
        }
    }
}
