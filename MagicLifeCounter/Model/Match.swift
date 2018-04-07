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

class Match: ScoreCheckable {
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
        
        player1.delegate = self
        player2.delegate = self
    }
    
    func endRound() {
        if self.player1.currentLife == 0 {
            self.increaseScorePlayerTwo()
        } else if self.player2.currentLife == 0 {
            self.increaseScorePlayerOne()
        }
        
        self.player1.resetPlayerScore()
        self.player2.resetPlayerScore()
        
        gameHasEnded()
    }
    
    func increaseScorePlayerOne() {
        self.matchScorePlayer1 += 1
    }
    
    func increaseScorePlayerTwo() {
        self.matchScorePlayer2 += 1
    }
    
    private func gameHasEnded() {
        if self.numberOfRounds.rawValue / 2 < self.matchScorePlayer1 ||
            self.numberOfRounds.rawValue / 2 < self.matchScorePlayer2 {
            delegate?.endGame()
        }
    }
}
