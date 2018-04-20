//
//  ViewController.swift
//  MagicLifeCounter
//
//  Created by GS on 05/04/18.
//  Copyright © 2018 GS. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    fileprivate let screenHeight = UIScreen.main.bounds.size.height + 20
    
    private var logo: UIButton!
    private var viewConfig = ConfigView()
    private var firstView = UIView()
    private var secondView = UIView()
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        logo = UIButton()
        logo.setImage(#imageLiteral(resourceName: "logo"), for: .normal)
        logo.addTarget(self, action: #selector(openOptions), for: .touchUpInside)
        logo.imageView?.contentMode = .scaleAspectFill
        
        self.view.addSubview(viewConfig)
        self.view.addSubview(firstView)
        self.view.addSubview(secondView)
        self.view.addSubview(logo)
        
        logo.snp.makeConstraints { (make) in
            make.width.equalTo(50)
            make.height.equalTo(50)
            make.center.equalTo(self.view)
        }
        
        viewConfig.backgroundColor = .blue
        
        viewConfig.snp.makeConstraints { (make) in
            make.height.equalTo(60)
            make.width.equalTo(self.view)
            make.center.equalTo(self.view)
        }

        firstView.snp.makeConstraints { (make) in
            make.topMargin.equalTo(self.view)
            make.width.equalTo(self.view)
            make.height.equalTo(screenHeight / 2)
        }
        
        secondView.snp.makeConstraints { (make) in
            make.bottomMargin.equalTo(self.view)
            make.width.equalTo(self.view)
            make.height.equalTo(screenHeight / 2)
        }

    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p1 = Player.init(GameConfig(), playerName: "Jogador 1", playerColor: .black)
        let p2 = Player.init(GameConfig(), playerName: "Jogador 2", playerColor: .red)
        
        firstView = PlayerScoreView.init(frame: firstView.frame, player: p1)
        secondView = PlayerScoreView.init(frame: secondView.frame, player: p2)

        firstView.transform = CGAffineTransform(rotationAngle: (180.0 * .pi) / 180.0)
    }
    
    @objc func openOptions() {
        UIView.animate(withDuration: 0.5) {
            self.firstView.snp.updateConstraints({ (make) in
                make.height.equalTo(self.firstView.frame.height - 30)
            })
            
            self.secondView.snp.updateConstraints({ (make) in
                make.height.equalTo(self.secondView.frame.height - 30)
            })
            
            self.logo.alpha = 0
        }
    }
}
