//
//  Match.swift
//  MagicLifeCounter
//
//  Created by GS on 05/04/18.
//  Copyright © 2018 GS. All rights reserved.
//

import Foundation

enum NumberOfRounds: Int {
    case one = 1
    case three = 3
    case five = 5
}

protocol GameCheckable {
    func endGame()
}

struct Match {
    var player1: Player
    var player2: Player
    var numberOfRounds: NumberOfRounds
    var matchScorePlayer1: Int = 0
    var matchScorePlayer2: Int = 0
    
    var delegate: GameCheckable?
    
    init(_ firstPlayer: Player, secondPlayer: Player, numberOfRounds: NumberOfRounds) {
        self.player1 = firstPlayer
        self.player2 = secondPlayer
        self.numberOfRounds = numberOfRounds
    }
    
    mutating func roundIsFinished() -> Bool {
        if self.player1.currentLife == 0 {
            self.increaseScorePlayerTwo()
        } else if self.player2.currentLife == 0 {
            self.increaseScorePlayerOne()
        } else {
            return false
        }
        
        self.player1.resetPlayerScore()
        self.player2.resetPlayerScore()
    
        gameHasEnded()
        
        return true
    }
    
    mutating func increaseScorePlayerOne() {
        self.matchScorePlayer1 += 1
    }
    
    mutating func increaseScorePlayerTwo() {
        self.matchScorePlayer2 += 1
    }
    
    private func gameHasEnded() {
        if self.numberOfRounds.rawValue / 2 < self.matchScorePlayer1 ||
            self.numberOfRounds.rawValue / 2 < self.matchScorePlayer2 {
            delegate?.endGame()
        }
    }
}
