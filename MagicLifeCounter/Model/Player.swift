//
//  Player.swift
//  MagicLifeCounter
//
//  Created by GS on 05/04/18.
//  Copyright © 2018 GS. All rights reserved.
//

import Foundation

enum ColorType {
    case Red
    case Green
    case Blue
    case Black
    case White
}

protocol LifeCheckable {
    mutating func informPlayerDied()
}

struct Player {
    private var gameConfig: GameConfig!
    var name: String = ""
    var color: ColorType = ColorType.Green
    var currentLife: Int
    
    var delegate: LifeCheckable?
    
    init(_ currentConfig: GameConfig, playerName: String, playerColor: ColorType) {
        self.gameConfig = currentConfig
        self.name = playerName
        self.color = playerColor
        self.currentLife = self.gameConfig.startingLife
    }
    
    mutating func incrementLife() {
        self.currentLife += 1
    }
    
    mutating func decrementLife() {
        self.currentLife -= 1
        if self.currentLife == 0 {
            delegate?.informPlayerDied()
        }
    }
    
    mutating func resetPlayerScore() {
        self.currentLife = self.gameConfig.startingLife
    }
}
