//
//  Game.swift
//  Bullseye2024
//
//  Created by Instructor on 5/3/24.
//

import Foundation

// Represents the state of a game: target number, current score, and current round.
struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    
    func points(sliderValue: Int) -> Int {
        // Calculate the difference between the target value and the current slider value.
        // Using absolute value to ensure the score is a positive number.
        let difference = abs(target - sliderValue)
        return 100 - difference
    }
    
    // Updates the score, advances to the next round, and generates a new target number.
    mutating func startNewRound(points: Int) {
        score += points
        round += 1
        target = Int.random(in: 1...100)
    }
    
    // Resets the game state: score to zero, resets rounds, new target number.
    mutating func restart() {
        score = 0
        round = 1
        target = Int.random(in: 1...100)
    }
}

