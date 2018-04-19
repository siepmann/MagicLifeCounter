//
//  PlayerScoreView.swift
//  MagicLifeCounter
//
//  Created by Guilherme Siepmann on 16/04/18.
//  Copyright © 2018 GS. All rights reserved.
//

import UIKit
import SnapKit

class PlayerScoreView: UIView {
    private var playerLife: UILabel!
    private var bgImage: UIImageView!
    private var playerPoisonCounter: UISlider!
    
    private var currentPlayer: Player
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        self.addSubview(bgImage)
        self.addSubview(playerLife)
        self.addSubview(playerPoisonCounter)
        
        bgImage.snp.makeConstraints { (make) in
            make.topMargin.equalTo(self)
            make.leadingMargin.equalTo(self)
            make.trailingMargin.equalTo(self)
            make.bottomMargin.equalTo(self)
        }

        playerLife.snp.makeConstraints { (make) in
            make.center.equalTo(self)
            make.width.equalTo(88)
            make.height.equalTo(84)
        }

        playerPoisonCounter.snp.makeConstraints { (make) in
            make.leadingMargin.equalTo(self).offset(70)
            make.trailingMargin.equalTo(self).offset(-70)
            make.bottom.equalTo(self).offset(-35)
        }
    }
    
    private func configureUIView() {
        self.backgroundColor = .black
        
        playerLife = UILabel()
        playerLife.font = UIFont.systemFont(ofSize: 70)
        playerLife.textColor = .white
        playerLife.text = "\(currentPlayer.currentLife)"
       
        
        bgImage = UIImageView()
        
        playerPoisonCounter = UISlider()
        playerPoisonCounter.value = 0
        playerPoisonCounter.minimumValue = 0
        playerPoisonCounter.maximumValue = 10
    }
    
    init(frame: CGRect, player: Player) {
        self.currentPlayer = player
        super.init(frame: frame)
        configureUIView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func decreaseLife(_ sender: Any) {
        currentPlayer.decrementLife()
        changeCurrentLife()
    }
    
    @IBAction func increaseLife(_ sender: Any) {
        currentPlayer.incrementLife()
        changeCurrentLife()
    }
    
    fileprivate func changeCurrentLife() {
        self.playerLife.text = "\(currentPlayer.currentLife)"
    }
    
}
