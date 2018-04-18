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
        let p1 = Player.init(GameConfig(), playerName: "Jogador 1", playerColor: .black)
        let view1 : PlayerScoreView = .fromNib()
        view1.frame = frameView1
        (view1 ).setup(player: p1)
        
        let frameView2 = CGRect(x:0 , y: screenSize.height - (screenSize.height / 2), width: screenSize.width, height: screenSize.height / 2)
        let p2 = Player.init(GameConfig(), playerName: "Jogador 2", playerColor: .red)
        let view2 : PlayerScoreView = .fromNib()
        view2.frame = frameView2
        (view2 ).setup(player: p2)
        
        
        view1.transform = CGAffineTransform(rotationAngle: (180.0 * .pi) / 180.0)
        
        self.view.addSubview(view1)
        self.view.addSubview(view2)
    }
}
