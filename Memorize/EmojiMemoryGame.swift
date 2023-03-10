//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by rnake on 2023/2/27.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    private static let emojis = ["ð", "ð", "ð", "ð", "ð", "ð", "ð»", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "âï¸", "ð", "ð¸", "ð", "ð¶", "âµï¸", "ð³", "â´", "ð", "ð"]
    
    // è¢«'@Published'ä¿®é¥°çåéï¼å¨ä»»ä½æ¶åä¸æ¦åéåå®¹åçæ¹åï¼å°±ä¼èªå¨è§¦åobjectWillChange.send()æä½
    @Published private var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsOfCards: 6) { pairIndex in
        return EmojiMemoryGame.emojis[pairIndex]
    }
//    var objectWillChange: ObservableObjectPublisher // å½æä»¬æä»ObservableObjectåè®®æ¶ï¼ç³»ç»ä¼èªå¨æ¥æè¿ä¸ªåéï¼æä»¬å¯ä»¥ä½¿ç¨å®æ¥åå¸modelæ°æ®åçäºåå
    
    var cards: [Card] {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: Card) {
//        objectWillChange.send()
        model.choose(card)
    }
}
