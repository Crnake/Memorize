//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Rnake on 2023/2/25.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
