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
    private var increaseLifeButton: UIButton!
    private var decreaseLifeButton: UIButton!
    
    private var currentPlayer: Player
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        self.addSubview(bgImage)
        self.addSubview(playerLife)
        self.addSubview(playerPoisonCounter)
        self.addSubview(increaseLifeButton)
        self.addSubview(decreaseLifeButton)
        
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
        
        increaseLifeButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(playerLife)
            make.right.equalTo(playerLife).offset(60)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        
        decreaseLifeButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(playerLife)
            make.left.equalTo(playerLife).offset(-60)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
    }
    
    private func configureUIView() {
        self.backgroundColor = currentPlayer.getPlayerColor()
        
        playerLife = UILabel()
        playerLife.font = UIFont.systemFont(ofSize: 70)
        playerLife.textColor = .white
        playerLife.textAlignment = .center
        playerLife.text = "\(currentPlayer.getPlayerCurrentLife())"
        
        bgImage = UIImageView()
        
        playerPoisonCounter = UISlider()
        playerPoisonCounter.value = 0
        playerPoisonCounter.minimumValue = 0
        playerPoisonCounter.maximumValue = 10
        
        increaseLifeButton = UIButton()
        increaseLifeButton.setTitle("+", for: .normal)
        increaseLifeButton.titleLabel?.textAlignment = .center
        increaseLifeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 50)
        increaseLifeButton.addTarget(self, action: #selector(increaseLife), for: .touchUpInside)
        
        decreaseLifeButton = UIButton()
        decreaseLifeButton.setTitle("-", for: .normal)
        decreaseLifeButton.titleLabel?.textAlignment = .center
        decreaseLifeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 50)
        decreaseLifeButton.addTarget(self, action: #selector(decreaseLife), for: .touchUpInside)
    }
    
    init(frame: CGRect, player: Player) {
        self.currentPlayer = player
        super.init(frame: frame)
        self.isUserInteractionEnabled = true
        configureUIView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func decreaseLife() {
        currentPlayer.decrementLife()
        changeCurrentLifeText()
    }
    
    @objc private func increaseLife() {
        currentPlayer.incrementLife()
        changeCurrentLifeText()
    }
    
    fileprivate func changeCurrentLifeText() {
        playerLife.text = "\(currentPlayer.getPlayerCurrentLife())"
    }
    
}
