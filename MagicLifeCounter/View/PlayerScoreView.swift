//
//  PlayerScoreView.swift
//  MagicLifeCounter
//
//  Created by Guilherme Siepmann on 16/04/18.
//  Copyright © 2018 GS. All rights reserved.
//

import UIKit

extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}

class PlayerScoreView: UIView {

    @IBOutlet private weak var playerLife: UILabel!
    @IBOutlet private weak var bgImage: UIImageView!
    @IBOutlet private weak var playerPoisonCounter: UISlider!
    
    private var currentPlayer: Player?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setup(player: Player) {
        self.currentPlayer = player
    }
    
    @IBAction func decreaseLife(_ sender: Any) {
        guard let player = currentPlayer else { return }
        player.decrementLife()
        changeCurrentLife()
    }
    
    @IBAction func increaseLife(_ sender: Any) {
        guard let player = currentPlayer else { return }
        player.incrementLife()
        changeCurrentLife()
    }
    
    fileprivate func changeCurrentLife() {
        guard let player = currentPlayer else { return }
        self.playerLife.text = "\(player.currentLife)"
    }
    
}
