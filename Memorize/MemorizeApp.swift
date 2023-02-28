//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Rnake on 2023/2/25.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
