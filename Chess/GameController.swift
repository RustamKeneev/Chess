//
//  ViewController.swift
//  Chess
//
//  Created by Rustam Keneev on 13/11/21.
//

import UIKit
import SnapKit

class GameController: UIViewController {

    private lazy var gameField: GameField = {
        return GameField()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(gameField)
        gameField.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.center.equalToSuperview()
            make.height.equalTo(gameField.snp.width)
        }
        
    }


}

