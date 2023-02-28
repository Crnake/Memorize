//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Rnake on 2023/2/25.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    var body: some View {
        AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
            if card.isMatched && !card.isFaceUp {
                Rectangle().opacity(0)
            } else {
                CardView(card: card)
                    .padding(4)
                    .onTapGesture {
                        game.choose(card)
                    }
            }
        }
        .foregroundColor(.red)
        .padding(.horizontal)
    }
}



struct CardView: View {
    let card: EmojiMemoryGame.Card
    var body: some View {
        let cardShape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
        GeometryReader { geometry in
            ZStack {
                if card.isFaceUp {
                    cardShape.foregroundColor(.white)
                    cardShape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Circle().padding(5).opacity(0.5)
                    Text(card.content).font(font(in: geometry.size))
                } else if card.isMatched {
                    cardShape.opacity(0)
                } else {
                    cardShape.fill()
                }
            }
        }
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    private struct DrawingConstants {
        static let cornerRadius = 10.0
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.7
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(game.cards.first!)
        return EmojiMemoryGameView(game: game)
//        ContentView()
//            .preferredColorScheme(.dark)
    }
}
