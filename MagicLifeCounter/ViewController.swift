//
//  ViewController.swift
//  MagicLifeCounter
//
//  Created by GS on 05/04/18.
//  Copyright © 2018 GS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let screenSize = UIScreen.main.bounds.size
        let frameView1 = CGRect(x:0 , y: 0, width: screenSize.width, height: screenSize.height / 2)
        let view1 = PlayerScoreView.init(frame: frameView1, player: Player.init(GameConfig(), playerName: "Jogador 1", playerColor: .black))
        
        let frameView2 = CGRect(x:0 , y: screenSize.height - (screenSize.height / 2), width: screenSize.width, height: screenSize.height / 2)
        let view2 = PlayerScoreView.init(frame: frameView2, player: Player.init(GameConfig(), playerName: "Jogador 2", playerColor: .red))
        
        view2.layer.transform = CATransform3DMakeRotation(180, 0, 0, 0)
        
        self.view.addSubview(view1)
        self.view.addSubview(view2)
    }
}
