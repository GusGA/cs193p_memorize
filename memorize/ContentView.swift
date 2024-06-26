//
//  ContentView.swift
//  memorize
//
//  Created by Gustavo Gimenez on 26-06-24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            CardView(isFaceUp: true)
            CardView(isFaceUp: false)
            CardView(isFaceUp: true)
            CardView(isFaceUp: false)
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    // temprary state
    @State var isFaceUp = false
    var body: some View{
        ZStack(content: {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text("🥸").font(.largeTitle)
            } else {
                base
            }
        })
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
