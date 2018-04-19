//
//  PlayerTests.swift
//  MagicLifeCounterTests
//
//  Created by GS on 06/04/18.
//  Copyright © 2018 GS. All rights reserved.
//

import XCTest
@testable import MagicLifeCounter

class PlayerTests: XCTestCase {
    private var p1: Player!
    
    override func setUp() {
        p1 = Player(GameConfig(), playerName: "Player 1", playerColor: .red)
    }
    
    func testLifeIncrement() {
        let currentLife = p1.getPlayerCurrentLife()
        p1.incrementLife()
        XCTAssertTrue(p1.getPlayerCurrentLife() > currentLife)
    }
    
    func testLifeDecrement() {
        let currentLife = p1.getPlayerCurrentLife()
        p1.decrementLife()
        XCTAssertTrue(p1.getPlayerCurrentLife() < currentLife)
    }
    
    func testPlayerColor() {
        XCTAssertTrue(p1.getPlayerColor() == .red)
    }
    
    func testResetScore() {
        p1.incrementLife()
        p1.incrementLife()
        p1.incrementLife()
        
        p1.resetPlayerScore()
        XCTAssertTrue(p1.getPlayerCurrentLife() == GameConfig().startingLife)
    }
}
