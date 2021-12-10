//
//  ContentView.swift
//  Memorize
//
//  Created by Alan Lomeli on 05/12/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 3)
            Text("Hello, world")
        }
        .padding()
        .foregroundColor(.red)
       
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
