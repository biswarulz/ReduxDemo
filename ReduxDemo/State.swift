//
//  State.swift
//  ReduxDemo
//
//  Created by Biswajyoti Sahu on 20/02/22.
//

import Foundation

struct AppState {
    
    var player1: Play
    var player2: Play
    var message: Message
    var turn: Turn
    var result: Result?
    
    init() {
        
        self.player1 = Play(choosen: false, weapon: nil)
        self.player2 = Play(choosen: false, weapon: nil)
        self.message = .player1Choose
        self.turn = Turn(player: .player1)
    }
}

enum Message: String {
    
    case player1Choose = "Player 1: Choose your weapon"
    case player2Choose = "Player 2: Choose your weapon"
    case player1Won = "Player 1 won"
    case player2Won = "Player 2 won"
    case draw = "Draw !!"
}

enum Player {
    case player1
    case player2
}

enum Weapon {
    
    case rock
    case paper
    case scissor
}

struct Turn {
    
    var player: Player
}

struct Play {
    
    var choosen: Bool
    var weapon: Weapon?
}

enum Result {
    
    case player1Won
    case player2Won
    case draw
}
