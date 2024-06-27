//
//  EmojiMemoryGameView.swift
//  memorize
//
//  Created by Gustavo Gimenez on 26-06-24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    private let aspectRatio: CGFloat = 2/3
    var body: some View {
        VStack {
            ScrollView{
                cards.animation(.default, value: viewModel.cards)
            }
            Button("shuffle cards") {
                viewModel.shuffle()
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(6.0)
            
        }
       .padding()
    }
    
    var cards: some View{
        GeometryReader{ geometry in
            let gridItemSize = gridItemWidthThatFits(
                count: viewModel.cards.count, 
                size: geometry.size,
                atAspecRatio: 2/3
            )
            LazyVGrid(columns: [GridItem(.adaptive(minimum: gridItemSize), spacing: 0)], spacing: 0){
                ForEach(viewModel.cards) { card in
                    CardView(card)
                        .aspectRatio(aspectRatio, contentMode: .fit)
                        .padding(4)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
        }
        .foregroundColor(.green)
    }
    
    func gridItemWidthThatFits(count: Int, size: CGSize, atAspecRatio aspectRatio: CGFloat) -> CGFloat {
        let count = CGFloat(count)
        var columCount = 1
//        repeat {
            print("inside repeat")
//            let width = size.width / columCount
//            let height = width / aspectRatio
//            
//            let rowCount = (count / columCount).rounded(.up)
//            if rowCount * height < size.height {
//                return (size.width / columCount).rounded(.down)
//            }
//            columCount += 1
//        } while columCount < count
        
//        return min(size.width / count, size.height * aspectRatio).rounded(.down)
        
        return 85
    }
    
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View{
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group{
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size:100))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill()
                .opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
