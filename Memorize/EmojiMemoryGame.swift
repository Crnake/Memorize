//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by rnake on 2023/2/27.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    private static let emojis = ["🚗", "🚌", "🏎", "🚓", "🚑", "🚒", "🛻", "🚚", "🚛", "🚜", "🚟", "🚃", "🚝", "🚂", "✈️", "🚀", "🛸", "🚁", "🛶", "⛵️", "🛳", "⛴", "🚄", "🚅"]
    
    // 被'@Published'修饰的变量，在任何时候一旦变量内容发生改变，就会自动触发objectWillChange.send()操作
    @Published private var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsOfCards: 6) { pairIndex in
        return EmojiMemoryGame.emojis[pairIndex]
    }
//    var objectWillChange: ObservableObjectPublisher // 当我们服从ObservableObject协议时，系统会自动拥有这个变量，我们可以使用它来发布model数据发生了变化
    
    var cards: [Card] {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: Card) {
//        objectWillChange.send()
        model.choose(card)
    }
}
