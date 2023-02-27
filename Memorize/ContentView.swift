//
//  ContentView.swift
//  Memorize
//
//  Created by Rnake on 2023/2/25.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🚗", "🚌", "🏎", "🚓", "🚑", "🚒", "🛻", "🚚", "🚛", "🚜", "🚟", "🚃", "🚝", "🚂", "✈️", "🚀", "🛸", "🚁", "🛶", "⛵️", "🛳", "⛴", "🚄", "🚅"]
    @State var emojiCount = 8
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                    ForEach(emojis[0..<emojiCount], id:\.self) { emoji in
                        CardView(cardContent: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
                .padding(.horizontal)
                .foregroundColor(.red)
            }
            Spacer()
            HStack {
                addButton
                Spacer()
                delButton
            }.font(.largeTitle).padding(.horizontal)
        }
    }
    var addButton: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    var delButton: some View {
        Button {
            if emojiCount > 0 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
}



struct CardView: View {
    @State var isFaceUp = true
    var cardContent = "🚀"
    var body: some View {
        let cardShape = RoundedRectangle(cornerRadius: 25.0)
        VStack {
            ZStack {
                if isFaceUp {
                    cardShape.foregroundColor(.white)
                    cardShape.strokeBorder(lineWidth: 3)
                    Text(cardContent).font(.largeTitle)
                } else {
                    cardShape.fill()
                }
            }.onTapGesture { isFaceUp.toggle() }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//        ContentView()
//            .preferredColorScheme(.dark)
    }
}
