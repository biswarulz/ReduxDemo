//
//  Reducer.swift
//  ReduxDemo
//
//  Created by Biswajyoti Sahu on 20/02/22.
//

import ReSwift

func appReducer(action: Action, appState: AppState?) -> AppState {
    
    var state = appState ?? AppState()
    
    switch action {
        
    case let chooseWeaponAction as ChooseWeaponAction:
    
        let turn = state.turn
        switch turn.player {
            
        case .player1:
            
            let play = Play(choosen: true, weapon: chooseWeaponAction.weapon)
            state.player1 = play
            state.turn = Turn(player: .player2)
            state.message = .player2Choose
        case .player2:
            
            let play = Play(choosen: true, weapon: chooseWeaponAction.weapon)
            state.player2 = play
            
            let player1Weapon = state.player1.weapon
            let player2Weapon = state.player2.weapon
            
            switch player1Weapon {
                
            case .rock:
                
                if player2Weapon == .rock {
                    
                    state.result = .draw
                    state.message = .draw
                } else if player2Weapon == .scissor {
                    
                    state.result = .player1Won
                    state.message = .player1Won
                } else if player2Weapon == .paper {
                    
                    state.result = .player2Won
                    state.message = .player2Won
                }
            case .scissor:
                
                if player2Weapon == .rock {
                    
                    state.result = .player2Won
                    state.message = .player2Won
                } else if player2Weapon == .scissor {
                    
                    state.result = .draw
                    state.message = .draw
                } else if player2Weapon == .paper {
                    
                    state.result = .player1Won
                    state.message = .player1Won
                }
            case .paper:
                
                if player2Weapon == .rock {
                    
                    state.result = .player1Won
                    state.message = .player1Won
                } else if player2Weapon == .scissor {
                    
                    state.result = .player2Won
                    state.message = .player2Won
                } else if player2Weapon == .paper {
                    
                    state.result = .draw
                    state.message = .draw
                }
            case .none:
                break
            }
        }
    default:
        break
    }
    
    return state
}
