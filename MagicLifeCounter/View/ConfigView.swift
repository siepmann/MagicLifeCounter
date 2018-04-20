//
//  ConfigView.swift
//  MagicLifeCounter
//
//  Created by GS on 19/04/18.
//  Copyright © 2018 GS. All rights reserved.
//

import UIKit
import SnapKit

class ConfigView: UIView {
    private var restartButton: UIButton!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addSubview(restartButton)
        restartButton.snp.makeConstraints { (make) in
            make.width.equalTo(40)
            make.height.equalTo(40)
            make.topMargin.equalTo(self).offset(10)
            make.leading.equalTo(self).offset(10)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        restartButton = UIButton()
        restartButton.setTitle("", for: .normal)
        restartButton.setImage(#imageLiteral(resourceName: "logo"), for: .normal)
    }
}
