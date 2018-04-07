//
//  Player.swift
//  MagicLifeCounter
//
//  Created by GS on 05/04/18.
//  Copyright © 2018 GS. All rights reserved.
//

import Foundation

enum ColorType {
    case red
    case green
    case blue
    case black
    case white
}

protocol ScoreCheckable {
    func endRound()
}

class Player {
    private var gameConfig: GameConfig!
    var name: String = ""
    var color: ColorType = .green
    var currentLife: Int
    
    var delegate: ScoreCheckable?
    
    init(_ currentConfig: GameConfig, playerName: String, playerColor: ColorType) {
        self.gameConfig = currentConfig
        self.name = playerName
        self.color = playerColor
        self.currentLife = self.gameConfig.startingLife
    }
    
    func incrementLife() {
        self.currentLife += 1
    }
    
    func decrementLife() {
        self.currentLife -= 1
        if currentLife == 0 {
            delegate?.endRound()
        }
    }
    
    func resetPlayerScore() {
        self.currentLife = self.gameConfig.startingLife
    }
}
