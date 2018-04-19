//
//  PlayerScoreView.swift
//  MagicLifeCounter
//
//  Created by Guilherme Siepmann on 16/04/18.
//  Copyright © 2018 GS. All rights reserved.
//

import UIKit
import SnapKit

//extension UIView {
//    class func fromNib<T: UIView>() -> T {
//        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
//    }
//}

class PlayerScoreView: UIView {

    private var playerLife: UILabel!
    private var bgImage: UIImageView!
    private var playerPoisonCounter: UISlider!
    
    private var currentPlayer: Player
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .black
        
        playerLife = UILabel()
        playerLife.font = UIFont.systemFont(ofSize: 70)
        playerLife.textColor = .white
        playerLife.text = "20"
        playerLife.snp.makeConstraints { (make) in
            make.center.equalTo(self.center)
            make.width.equalTo(88)
            make.height.equalTo(84)
        }
        
        bgImage = UIImageView()
        bgImage.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalTo(0)
        }
        
        playerPoisonCounter = UISlider()
        playerPoisonCounter.value = 0
        playerPoisonCounter.minimumValue = 0
        playerPoisonCounter.maximumValue = 10
        playerPoisonCounter.snp.makeConstraints { (make) in
            make.bottom.equalTo(playerLife).offset(30)
            make.leadingMargin.equalTo(self).offset(70)
            make.trailingMargin.equalTo(self).offset(70)
            make.bottom.equalTo(self).offset(20)
        }
        
        self.addSubview(bgImage)
        self.addSubview(playerLife)
        
    }
    
    init(frame: CGRect, player: Player) {
        self.currentPlayer = player
        super.init(frame: frame)
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
