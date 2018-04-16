//
//  PlayerScoreView.swift
//  MagicLifeCounter
//
//  Created by Guilherme Siepmann on 16/04/18.
//  Copyright © 2018 GS. All rights reserved.
//

import UIKit

class PlayerScoreView: UIView {

    @IBOutlet private weak var playerLife: UILabel!
    @IBOutlet private weak var bgImage: UIImageView!
    @IBOutlet private weak var playerPoisonCounter: UISlider!
    
    private var currentPlayer: Player
    
    init(frame: CGRect, player: Player){
        currentPlayer = player
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func decreaseLife(_ sender: Any) {
        self.currentPlayer.decrementLife()
    }
    
    @IBAction func increaseLife(_ sender: Any) {
        self.currentPlayer.incrementLife()
    }
    
    fileprivate func changeCurrentLife() {
        self.playerLife.text = "\(self.currentPlayer.currentLife)"
    }
    
}
