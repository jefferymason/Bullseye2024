//
//  BackgroundView.swift
//  Bullseye2024
//
//  Created by Instructor on 5/6/24.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game: Game
    
    var body: some View {
        VStack {
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
    }
}

// The top view of the game interface to reset game.
struct TopView: View {
    @Binding var game: Game
    
    var body: some View {
        HStack {
            Button(action: {
                game.restart()
            }) {
                RoundImageViewStroked(systemName: "arrow.counterclockwise")
            }
            Spacer()
        }
    }
}

// Represents a view displaying a number with a corresponding title.
struct NumberView: View {
    var title: String
    var text: String
    
    var body: some View {
        VStack(spacing: 5) {
            LabelText(text: title)
            RoundRectTextView(text: text)
        }
    }
}

// The bottom view of the game interface displaying the current score and round.
struct BottomView: View {
    @Binding var game: Game
    
    var body: some View {
        HStack {
            NumberView(title: "SCORE", text: String(game.score))
            Spacer()
            NumberView(title: "ROUND", text: String(game.score))
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
    }
}
