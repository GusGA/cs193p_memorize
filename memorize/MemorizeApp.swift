//
//  memorizeApp.swift
//  memorize
//
//  Created by Gustavo Gimenez on 26-06-24.
//

import SwiftUI

@main
struct memorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
