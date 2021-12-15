//
//  ContentView.swift
//  Memorize
//
//  Created by Alan Lomeli on 05/12/21.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🚘","🚂","🚌","✈️","🚲","🚐","🚃","🚠","🚢","🛶","🛺","🦼","🚑","🚜","🏎"]
    @State var numberOfCardsShown = 4;
    var body: some View {
    VStack {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum:65))]) {
                ForEach(emojis[0..<numberOfCardsShown], id: \.self){ emoji in //this 'emoji' is an argument of the function
                    CardView(content: emoji).aspectRatio(2/3,contentMode:.fit)
                }
            }
        }
        .foregroundColor(.red)
        Spacer()
        HStack {
            deleteCardButton
            Spacer()
            addCardButton
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().preferredColorScheme(.light)
        }
    }
}
