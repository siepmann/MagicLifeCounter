//
//  Player.swift
//  MagicLifeCounter
//
//  Created by GS on 05/04/18.
//  Copyright © 2018 GS. All rights reserved.
//

import Foundation
import UIKit

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
    var delegate: ScoreCheckable?
    
    private var name: String = ""
    private var currentLife: Int
    private var gameConfig: GameConfig!
    private var color: ColorType = .green
    
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
    
    func getPlayerName() -> String {
        return self.name
    }
    
    func getPlayerCurrentLife() -> Int {
        return currentLife
    }
    
    func getPlayerColor() -> UIColor {
        switch color {
        case .red: return .red
        case .green: return .green
        case .blue: return .blue
        case .black: return .black
        case .white: return .white
        }
    }
}
