//
//  GameConfig.swift
//  MagicLifeCounter
//
//  Created by GS on 05/04/18.
//  Copyright © 2018 GS. All rights reserved.
//

import Foundation

enum DiceType: Int {
    case fourSides = 0
    case sixSides = 1
    case tenSides = 2
    case twelveSides = 3
    case twentySides = 4
}

struct GameConfig {
    private var GAME_DEFAULT_LIFE_KEY = "defaultLife"
    private var GAME_DEFAULT_DICE_TYPE = "defaultDice"
    
    private var defaults = UserDefaults.standard
    
    var gameDurationInSeconds: Int = 3600
    
    var startingLife: Int {
        set {
            defaults.set(newValue, forKey: GAME_DEFAULT_LIFE_KEY)
        }
        get {
            guard let defaultLife = defaults.value(forKey: GAME_DEFAULT_LIFE_KEY) else { return 20 }
            return defaultLife as! Int
        }
    }
    
    var diceType: DiceType {
        set {
            defaults.set(newValue.rawValue, forKey: GAME_DEFAULT_DICE_TYPE)
        }
        get {
            guard let defaultDice = defaults.value(forKey: GAME_DEFAULT_DICE_TYPE) else { return DiceType.twentySides }
            return DiceType(rawValue: defaultDice as! Int)!
        }
    }
}
