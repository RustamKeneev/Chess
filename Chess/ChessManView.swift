//
//  ChessManView.swift
//  Chess
//
//  Created by Rustam Keneev on 14/11/21.
//

import Foundation
import UIKit

class ChessManView: UIView {
    
    private var kind: Kind
    private var chessType: ChessType
    
    private var isFirstSelect = true
    
    private var moves: [Move] = []
    
    private lazy var delegate: ChessManDelegate? = nil
    
    var id: Int
    
    init(delegate: ChessManDelegate, kind: Kind, chessType: ChessType) {
        self.kind = kind
        self.chessType = chessType
        self.id = Int.random(in: Int.min...Int.max)
        
//        switch kind {
//        case .black:
//            switch chessType {
//            case .pawn:
//                image = UIImage("black pawn")
//                break
//            case .horse:
//                image = UIImage("black horse")
//                break
//            }
//            break
//        case .white:
//            switch chessType {
//            case .pawn:
//                image = UIImage("white pawn")
//
//                break
//            case .horse:
//                image = UIImage("white horse")
//
//                break
//            }
//            break
//        }
        
        super.init(frame: .zero)
        
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func select() {
        switch kind {
        case .black:
            switch chessType {
            case .pawn:
                if isFirstSelect {
                    moves.append(Move(valueX: 0, valueY: -2))
                    moves.append(Move(valueX: 0, valueY: -1))
                } else {
                    moves.append(Move(valueX: 0, valueY: -1))
                }
                break
            case .horse:
                moves.append(Move(valueX: 1, valueY: -2))
                moves.append(Move(valueX: -1, valueY: -2))
                
                moves.append(Move(valueX: -2, valueY: 1))
                moves.append(Move(valueX: -2, valueY: -1))
                
                moves.append(Move(valueX: 1, valueY: 2))
                moves.append(Move(valueX: -1, valueY: 2))

                moves.append(Move(valueX: 2, valueY: 1))
                moves.append(Move(valueX: 2, valueY: -1))
                break
            }
            break
        case .white:
            switch chessType {
            case .pawn:
                if isFirstSelect {
                    moves.append(Move(valueX: 0, valueY: 2))
                    moves.append(Move(valueX: 0, valueY: 1))
                } else {
                    moves.append(Move(valueX: 0, valueY: 1))
                }
                break
            case .horse:
                moves.append(Move(valueX: 1, valueY: -2))
                moves.append(Move(valueX: -1, valueY: -2))
                
                moves.append(Move(valueX: -2, valueY: 1))
                moves.append(Move(valueX: -2, valueY: -1))
                
                moves.append(Move(valueX: 1, valueY: 2))
                moves.append(Move(valueX: -1, valueY: 2))

                moves.append(Move(valueX: 2, valueY: 1))
                moves.append(Move(valueX: 2, valueY: -1))
                break
            }
            break
        }
        
        delegate?.setupAllMove(chessman: self, moves: moves)
        moves.removeAll()
        
        isFirstSelect = false
    }
    
    enum Kind {
        case white
        case black
    }
    
    enum ChessType {
        case pawn
        case horse
    }
}

protocol ChessManDelegate {
    func setupAllMove(chessman: ChessManView, moves: [Move])
}
