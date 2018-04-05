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

struct Match: LifeCheckable {
    private var player1: Player
    private var player2: Player
    private var numberOfRounds: NumberOfRounds
    var matchScorePlayer1: Int = 0
    var matchScorePlayer2: Int = 0
    
    init(_ firstPlayer: Player, secondPlayer: Player, numberOfRounds: NumberOfRounds) {
        self.player1 = firstPlayer
        self.player2 = secondPlayer
        self.numberOfRounds = numberOfRounds
    
        self.player2.delegate = self
        self.player1.delegate = self
    }
    
    mutating func informPlayerDied() {
        if self.player1.currentLife == 0 {
            print("Player \(self.player1.name) died!")
        } else {
            print("Player \(self.player2.name) died!")
        }
        
        self.player1.resetPlayerScore()
        self.player2.resetPlayerScore()
    }
    
    mutating func increaseScorePlayerOne() {
        self.matchScorePlayer1 += 1
    }
    
    mutating func increaseScorePlayerTwo() {
        self.matchScorePlayer2 += 1
    }
    
    mutating func gameHasEnded() -> (Bool, Player?) {
        if self.numberOfRounds.rawValue / 2 < self.matchScorePlayer1 {
            return (true, player1)
        } else if self.numberOfRounds.rawValue / 2 < self.matchScorePlayer2 {
            return (true, player1)
        } else {
            return (false, nil)
        }
    }
}
