//
//  GameThemes.swift
//  Memorize
//
//  Created by Alan Lomeli on 24/01/22.
//

import Foundation
import SwiftUI

struct Theme<Content>{
    var name:String
    var content:[Content]
    var color:Color
    var numberOfPairs:Int
    init(name: String, content: [Content], color: Color,numberOfPairs:Int){
        self.name = name
        self.content = content.shuffled()
        self.color = color
        self.numberOfPairs = numberOfPairs
    }
    
}
struct StaticThemes {
 static let  natureTheme = Theme<String>(name: "Nature",content: ["🌿","🌹","🍎","🌻","🌸","🌳","🐢","🐣","🦎","🦚","🍁","🌧","☀️","🐇"], color: .green,numberOfPairs: 13)
static let  blueTheme = Theme<String>(name: "Blue",content: ["🐬","🐳","🌐","🇺🇳","💎","🧊","🌊","🌎","❄️","💙","🇫🇲","🔵","🚾","🌀"], color: .blue,numberOfPairs: 11)
static let  fruitTheme = Theme<String>(name: "Fruits",content: ["🍏","🍎","🍐","🍊","🍋","🍌","🍉","🍇","🍓","🍈","🍒","🍑","🥭","🍍","🥥","🥝"], color: .red,numberOfPairs: 10)
static let  vehiclesTheme = Theme<String>(name: "Vehicles",content: ["🚘","🚂","🚌","✈️","🚲","🚐","🚃","🚠","🚢","🛶","🛺","🦼","🚑","🚜","🏎"], color: .gray,numberOfPairs: 9)
static let  vegetablesTheme = Theme<String>(name: "Vegetables",content: ["🍅","🍆","🥑","🥦","🥬","🥒","🌶","🌽","🥕","🧄","🧅","🥔","🍠"], color: .orange,numberOfPairs: 13)
static let  heartTheme = Theme<String>(name: "Heart",content: ["❤️","🧡","💛","💚","💙","💜","🖤","🤍"], color: .pink,numberOfPairs: 8)
    
static let themes:[Theme<String>]=[natureTheme,blueTheme,fruitTheme,vehiclesTheme,vegetablesTheme,heartTheme]
}
