//
//  ContentView.swift
//  Memorize
//
//  Created by Rnake on 2023/2/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
                .foregroundColor(.red)
            }
        }.padding(.horizontal)
    }
}



struct CardView: View {
    let card: MemoryGame<String>.Card
    var body: some View {
        let cardShape = RoundedRectangle(cornerRadius: 25.0)
        VStack {
            ZStack {
                if card.isFaceUp {
                    cardShape.foregroundColor(.white)
                    cardShape.strokeBorder(lineWidth: 3)
                    Text(card.content).font(.largeTitle)
                } else if card.isMatched {
                    cardShape.opacity(0)
                } else {
                    cardShape.fill()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
//        ContentView()
//            .preferredColorScheme(.dark)
    }
}
