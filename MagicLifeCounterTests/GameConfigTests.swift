//
//  GameConfigTests.swift
//  MagicLifeCounterTests
//
//  Created by GS on 06/04/18.
//  Copyright © 2018 GS. All rights reserved.
//

import XCTest
@testable import MagicLifeCounter

class GameConfigTests: XCTestCase {
    func resetUserDefaults() {
        if let bundleID = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundleID)
        }
    }
    
    func testConfigNewDice() {
        resetUserDefaults()
        var config = GameConfig()
        config.diceType = DiceType.tenSides
        var newConfig = GameConfig()
        
        XCTAssertTrue(newConfig.diceType == DiceType.tenSides)
    }
    
    func testConfigNewStartLife() {
        resetUserDefaults()
        var config = GameConfig()
        config.startingLife = 40
        var newConfig = GameConfig()
        
        XCTAssertTrue(newConfig.startingLife == 40)
    }
    
}
