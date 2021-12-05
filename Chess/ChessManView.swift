//
//  ChessManView.swift
//  Chess
//
//  Created by Rustam Keneev on 14/11/21.
//

import Foundation
import UIKit

class ChessManView: UIImageView {
    
    var kind: Kind
    var chessType: ChessType
    var types: Bool
    
    private var isFirstSelect = true
    
    private var moves: [[Move]] = []
    
    private lazy var delegate: ChessManDelegate? = nil
    
    var id: Int
    
    init(delegate: ChessManDelegate, kind: Kind, chessType: ChessType) {
        self.kind = kind
        self.chessType = chessType
        self.id = Int.random(in: Int.min...Int.max)
        
        switch kind {
        case .black:
            types = false
            break
        case .white:
            types = true
            break
        }
        
        super.init(frame: .zero)
        
        self.image = UIImage(named: "\(chessType.rawValue)_\(kind.rawValue)")
        tag = 1
        
        contentMode = .scaleAspectFit
        
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func rechange() {
        chessType = .king
        
        self.image = UIImage(named: "\(chessType.rawValue)_\(kind.rawValue)")
    }
    
    func select(reselect: Bool = true) {
        switch kind {
        case .black:
            switch chessType {
            case .pawn:
                var move: [Move] = []
                
                if isFirstSelect {
                    move.append(Move(valueX: 0, valueY: -1))
                    move.append(Move(valueX: 0, valueY: -2))
                } else {
                    move.append(Move(valueX: 0, valueY: -1))
                }
                moves.append(move)
                break
            case .horse:
                var move: [Move] = []
                
                move.append(Move(valueX: 1, valueY: -2))
                move.append(Move(valueX: -1, valueY: -2))
                
                move.append(Move(valueX: -2, valueY: 1))
                move.append(Move(valueX: -2, valueY: -1))
                
                move.append(Move(valueX: 1, valueY: 2))
                move.append(Move(valueX: -1, valueY: 2))

                move.append(Move(valueX: 2, valueY: 1))
                move.append(Move(valueX: 2, valueY: -1))
                
                moves.append(move)
                break
            case .rook:
                var move1: [Move] = []
                var move2: [Move] = []
                var move3: [Move] = []
                var move4: [Move] = []

                move1.append(Move(valueX: 0, valueY: 1))
                move1.append(Move(valueX: 0, valueY: 2))
                move1.append(Move(valueX: 0, valueY: 3))
                move1.append(Move(valueX: 0, valueY: 4))
                move1.append(Move(valueX: 0, valueY: 5))
                move1.append(Move(valueX: 0, valueY: 6))
                move1.append(Move(valueX: 0, valueY: 7))

                move2.append(Move(valueX: 0, valueY: -1))
                move2.append(Move(valueX: 0, valueY: -2))
                move2.append(Move(valueX: 0, valueY: -3))
                move2.append(Move(valueX: 0, valueY: -4))
                move2.append(Move(valueX: 0, valueY: -5))
                move2.append(Move(valueX: 0, valueY: -6))
                move2.append(Move(valueX: 0, valueY: -7))

                move3.append(Move(valueX: 1, valueY: 0))
                move3.append(Move(valueX: 2, valueY: 0))
                move3.append(Move(valueX: 3, valueY: 0))
                move3.append(Move(valueX: 4, valueY: 0))
                move3.append(Move(valueX: 5, valueY: 0))
                move3.append(Move(valueX: 6, valueY: 0))
                move3.append(Move(valueX: 7, valueY: 0))

                move4.append(Move(valueX: -1, valueY: 0))
                move4.append(Move(valueX: -2, valueY: 0))
                move4.append(Move(valueX: -3, valueY: 0))
                move4.append(Move(valueX: -4, valueY: 0))
                move4.append(Move(valueX: -5, valueY: 0))
                move4.append(Move(valueX: -6, valueY: 0))
                move4.append(Move(valueX: -7, valueY: 0))
                
                moves.append(move1)
                moves.append(move2)
                moves.append(move3)
                moves.append(move4)
                break
            case .elephant:
                var move1: [Move] = []
                var move2: [Move] = []
                var move3: [Move] = []
                var move4: [Move] = []
                
                move1.append(Move(valueX: 1, valueY: 1))
                move1.append(Move(valueX: 2, valueY: 2))
                move1.append(Move(valueX: 3, valueY: 3))
                move1.append(Move(valueX: 4, valueY: 4))
                move1.append(Move(valueX: 5, valueY: 5))
                move1.append(Move(valueX: 6, valueY: 6))
                move1.append(Move(valueX: 7, valueY: 7))
//
                move2.append(Move(valueX: -1, valueY: -1))
                move2.append(Move(valueX: -2, valueY: -2))
                move2.append(Move(valueX: -3, valueY: -3))
                move2.append(Move(valueX: -4, valueY: -4))
                move2.append(Move(valueX: -5, valueY: -5))
                move2.append(Move(valueX: -6, valueY: -6))
                move2.append(Move(valueX: -7, valueY: -7))
//
                move3.append(Move(valueX: 1, valueY: -1))
                move3.append(Move(valueX: 2, valueY: -2))
                move3.append(Move(valueX: 3, valueY: -3))
                move3.append(Move(valueX: 4, valueY: -4))
                move3.append(Move(valueX: 5, valueY: -5))
                move3.append(Move(valueX: 6, valueY: -6))
                move3.append(Move(valueX: 7, valueY: -7))
//
                move4.append(Move(valueX: -1, valueY: 1))
                move4.append(Move(valueX: -2, valueY: 2))
                move4.append(Move(valueX: -3, valueY: 3))
                move4.append(Move(valueX: -4, valueY: 4))
                move4.append(Move(valueX: -5, valueY: 5))
                move4.append(Move(valueX: -6, valueY: 6))
                move4.append(Move(valueX: -7, valueY: 7))
                
                moves.append(move1)
                moves.append(move2)
                moves.append(move3)
                moves.append(move4)
                break
            case .king:
                moves.append([Move(valueX: 0, valueY: -1)])
                moves.append([Move(valueX: 0, valueY: 1)])
                moves.append([Move(valueX: -1, valueY: 0)])
                moves.append([Move(valueX: 1, valueY: 0)])

                moves.append([Move(valueX: -1, valueY: -1)])
                moves.append([Move(valueX: 1, valueY: 1)])
                moves.append([Move(valueX: -1, valueY: 1)])
                moves.append([Move(valueX: 1, valueY: -1)])
                break
            case .queen:
                var move1: [Move] = []
                var move2: [Move] = []
                var move3: [Move] = []
                var move4: [Move] = []
                var move5: [Move] = []
                var move6: [Move] = []
                var move7: [Move] = []
                var move8: [Move] = []
                
                move1.append(Move(valueX: 1, valueY: 1))
                move1.append(Move(valueX: 2, valueY: 2))
                move1.append(Move(valueX: 3, valueY: 3))
                move1.append(Move(valueX: 4, valueY: 4))
                move1.append(Move(valueX: 5, valueY: 5))
                move1.append(Move(valueX: 6, valueY: 6))
                move1.append(Move(valueX: 7, valueY: 7))

                move2.append(Move(valueX: -1, valueY: -1))
                move2.append(Move(valueX: -2, valueY: -2))
                move2.append(Move(valueX: -3, valueY: -3))
                move2.append(Move(valueX: -4, valueY: -4))
                move2.append(Move(valueX: -5, valueY: -5))
                move2.append(Move(valueX: -6, valueY: -6))
                move2.append(Move(valueX: -7, valueY: -7))

                move3.append(Move(valueX: 1, valueY: -1))
                move3.append(Move(valueX: 2, valueY: -2))
                move3.append(Move(valueX: 3, valueY: -3))
                move3.append(Move(valueX: 4, valueY: -4))
                move3.append(Move(valueX: 5, valueY: -5))
                move3.append(Move(valueX: 6, valueY: -6))
                move3.append(Move(valueX: 7, valueY: -7))

                move4.append(Move(valueX: -1, valueY: 1))
                move4.append(Move(valueX: -2, valueY: 2))
                move4.append(Move(valueX: -3, valueY: 3))
                move4.append(Move(valueX: -4, valueY: 4))
                move4.append(Move(valueX: -5, valueY: 5))
                move4.append(Move(valueX: -6, valueY: 6))
                move4.append(Move(valueX: -7, valueY: 7))

                move5.append(Move(valueX: 0, valueY: 1))
                move5.append(Move(valueX: 0, valueY: 2))
                move5.append(Move(valueX: 0, valueY: 3))
                move5.append(Move(valueX: 0, valueY: 4))
                move5.append(Move(valueX: 0, valueY: 5))
                move5.append(Move(valueX: 0, valueY: 6))
                move5.append(Move(valueX: 0, valueY: 7))

                move6.append(Move(valueX: 0, valueY: -1))
                move6.append(Move(valueX: 0, valueY: -2))
                move6.append(Move(valueX: 0, valueY: -3))
                move6.append(Move(valueX: 0, valueY: -4))
                move6.append(Move(valueX: 0, valueY: -5))
                move6.append(Move(valueX: 0, valueY: -6))
                move6.append(Move(valueX: 0, valueY: -7))

                move7.append(Move(valueX: 1, valueY: 0))
                move7.append(Move(valueX: 2, valueY: 0))
                move7.append(Move(valueX: 3, valueY: 0))
                move7.append(Move(valueX: 4, valueY: 0))
                move7.append(Move(valueX: 5, valueY: 0))
                move7.append(Move(valueX: 6, valueY: 0))
                move7.append(Move(valueX: 7, valueY: 0))

                move8.append(Move(valueX: -1, valueY: 0))
                move8.append(Move(valueX: -2, valueY: 0))
                move8.append(Move(valueX: -3, valueY: 0))
                move8.append(Move(valueX: -4, valueY: 0))
                move8.append(Move(valueX: -5, valueY: 0))
                move8.append(Move(valueX: -6, valueY: 0))
                move8.append(Move(valueX: -7, valueY: 0))
                
                moves.append(move1)
                moves.append(move2)
                moves.append(move3)
                moves.append(move4)
                moves.append(move5)
                moves.append(move6)
                moves.append(move7)
                moves.append(move8)
                break
            }
            break
        case .white:
            switch chessType {
            case .pawn:
                var move: [Move] = []
                
                if isFirstSelect {
                    move.append(Move(valueX: 0, valueY: 1))
                    move.append(Move(valueX: 0, valueY: 2))
                } else {
                    move.append(Move(valueX: 0, valueY: 1))
                }
                moves.append(move)
                break
            case .horse:
                var move: [Move] = []
                
                move.append(Move(valueX: 1, valueY: -2))
                move.append(Move(valueX: -1, valueY: -2))
                
                move.append(Move(valueX: -2, valueY: 1))
                move.append(Move(valueX: -2, valueY: -1))
                
                move.append(Move(valueX: 1, valueY: 2))
                move.append(Move(valueX: -1, valueY: 2))

                move.append(Move(valueX: 2, valueY: 1))
                move.append(Move(valueX: 2, valueY: -1))
                
                moves.append(move)
                break
            case .rook:
                var move1: [Move] = []
                var move2: [Move] = []
                var move3: [Move] = []
                var move4: [Move] = []

                move1.append(Move(valueX: 0, valueY: 1))
                move1.append(Move(valueX: 0, valueY: 2))
                move1.append(Move(valueX: 0, valueY: 3))
                move1.append(Move(valueX: 0, valueY: 4))
                move1.append(Move(valueX: 0, valueY: 5))
                move1.append(Move(valueX: 0, valueY: 6))
                move1.append(Move(valueX: 0, valueY: 7))

                move2.append(Move(valueX: 0, valueY: -1))
                move2.append(Move(valueX: 0, valueY: -2))
                move2.append(Move(valueX: 0, valueY: -3))
                move2.append(Move(valueX: 0, valueY: -4))
                move2.append(Move(valueX: 0, valueY: -5))
                move2.append(Move(valueX: 0, valueY: -6))
                move2.append(Move(valueX: 0, valueY: -7))

                move3.append(Move(valueX: 1, valueY: 0))
                move3.append(Move(valueX: 2, valueY: 0))
                move3.append(Move(valueX: 3, valueY: 0))
                move3.append(Move(valueX: 4, valueY: 0))
                move3.append(Move(valueX: 5, valueY: 0))
                move3.append(Move(valueX: 6, valueY: 0))
                move3.append(Move(valueX: 7, valueY: 0))

                move4.append(Move(valueX: -1, valueY: 0))
                move4.append(Move(valueX: -2, valueY: 0))
                move4.append(Move(valueX: -3, valueY: 0))
                move4.append(Move(valueX: -4, valueY: 0))
                move4.append(Move(valueX: -5, valueY: 0))
                move4.append(Move(valueX: -6, valueY: 0))
                move4.append(Move(valueX: -7, valueY: 0))
                
                moves.append(move1)
                moves.append(move2)
                moves.append(move3)
                moves.append(move4)
                break
            case .elephant:
                var move1: [Move] = []
                var move2: [Move] = []
                var move3: [Move] = []
                var move4: [Move] = []
                
                move1.append(Move(valueX: 1, valueY: 1))
                move1.append(Move(valueX: 2, valueY: 2))
                move1.append(Move(valueX: 3, valueY: 3))
                move1.append(Move(valueX: 4, valueY: 4))
                move1.append(Move(valueX: 5, valueY: 5))
                move1.append(Move(valueX: 6, valueY: 6))
                move1.append(Move(valueX: 7, valueY: 7))
//
                move2.append(Move(valueX: -1, valueY: -1))
                move2.append(Move(valueX: -2, valueY: -2))
                move2.append(Move(valueX: -3, valueY: -3))
                move2.append(Move(valueX: -4, valueY: -4))
                move2.append(Move(valueX: -5, valueY: -5))
                move2.append(Move(valueX: -6, valueY: -6))
                move2.append(Move(valueX: -7, valueY: -7))
//
                move3.append(Move(valueX: 1, valueY: -1))
                move3.append(Move(valueX: 2, valueY: -2))
                move3.append(Move(valueX: 3, valueY: -3))
                move3.append(Move(valueX: 4, valueY: -4))
                move3.append(Move(valueX: 5, valueY: -5))
                move3.append(Move(valueX: 6, valueY: -6))
                move3.append(Move(valueX: 7, valueY: -7))
//
                move4.append(Move(valueX: -1, valueY: 1))
                move4.append(Move(valueX: -2, valueY: 2))
                move4.append(Move(valueX: -3, valueY: 3))
                move4.append(Move(valueX: -4, valueY: 4))
                move4.append(Move(valueX: -5, valueY: 5))
                move4.append(Move(valueX: -6, valueY: 6))
                move4.append(Move(valueX: -7, valueY: 7))
                
                moves.append(move1)
                moves.append(move2)
                moves.append(move3)
                moves.append(move4)
                break
            case .king:
                moves.append([Move(valueX: 0, valueY: -1)])
                moves.append([Move(valueX: 0, valueY: 1)])
                moves.append([Move(valueX: -1, valueY: 0)])
                moves.append([Move(valueX: 1, valueY: 0)])

                moves.append([Move(valueX: -1, valueY: -1)])
                moves.append([Move(valueX: 1, valueY: 1)])
                moves.append([Move(valueX: -1, valueY: 1)])
                moves.append([Move(valueX: 1, valueY: -1)])
                break
            case .queen:
                var move1: [Move] = []
                var move2: [Move] = []
                var move3: [Move] = []
                var move4: [Move] = []
                var move5: [Move] = []
                var move6: [Move] = []
                var move7: [Move] = []
                var move8: [Move] = []
                
                move1.append(Move(valueX: 1, valueY: 1))
                move1.append(Move(valueX: 2, valueY: 2))
                move1.append(Move(valueX: 3, valueY: 3))
                move1.append(Move(valueX: 4, valueY: 4))
                move1.append(Move(valueX: 5, valueY: 5))
                move1.append(Move(valueX: 6, valueY: 6))
                move1.append(Move(valueX: 7, valueY: 7))

                move2.append(Move(valueX: -1, valueY: -1))
                move2.append(Move(valueX: -2, valueY: -2))
                move2.append(Move(valueX: -3, valueY: -3))
                move2.append(Move(valueX: -4, valueY: -4))
                move2.append(Move(valueX: -5, valueY: -5))
                move2.append(Move(valueX: -6, valueY: -6))
                move2.append(Move(valueX: -7, valueY: -7))

                move3.append(Move(valueX: 1, valueY: -1))
                move3.append(Move(valueX: 2, valueY: -2))
                move3.append(Move(valueX: 3, valueY: -3))
                move3.append(Move(valueX: 4, valueY: -4))
                move3.append(Move(valueX: 5, valueY: -5))
                move3.append(Move(valueX: 6, valueY: -6))
                move3.append(Move(valueX: 7, valueY: -7))

                move4.append(Move(valueX: -1, valueY: 1))
                move4.append(Move(valueX: -2, valueY: 2))
                move4.append(Move(valueX: -3, valueY: 3))
                move4.append(Move(valueX: -4, valueY: 4))
                move4.append(Move(valueX: -5, valueY: 5))
                move4.append(Move(valueX: -6, valueY: 6))
                move4.append(Move(valueX: -7, valueY: 7))

                move5.append(Move(valueX: 0, valueY: 1))
                move5.append(Move(valueX: 0, valueY: 2))
                move5.append(Move(valueX: 0, valueY: 3))
                move5.append(Move(valueX: 0, valueY: 4))
                move5.append(Move(valueX: 0, valueY: 5))
                move5.append(Move(valueX: 0, valueY: 6))
                move5.append(Move(valueX: 0, valueY: 7))

                move6.append(Move(valueX: 0, valueY: -1))
                move6.append(Move(valueX: 0, valueY: -2))
                move6.append(Move(valueX: 0, valueY: -3))
                move6.append(Move(valueX: 0, valueY: -4))
                move6.append(Move(valueX: 0, valueY: -5))
                move6.append(Move(valueX: 0, valueY: -6))
                move6.append(Move(valueX: 0, valueY: -7))

                move7.append(Move(valueX: 1, valueY: 0))
                move7.append(Move(valueX: 2, valueY: 0))
                move7.append(Move(valueX: 3, valueY: 0))
                move7.append(Move(valueX: 4, valueY: 0))
                move7.append(Move(valueX: 5, valueY: 0))
                move7.append(Move(valueX: 6, valueY: 0))
                move7.append(Move(valueX: 7, valueY: 0))

                move8.append(Move(valueX: -1, valueY: 0))
                move8.append(Move(valueX: -2, valueY: 0))
                move8.append(Move(valueX: -3, valueY: 0))
                move8.append(Move(valueX: -4, valueY: 0))
                move8.append(Move(valueX: -5, valueY: 0))
                move8.append(Move(valueX: -6, valueY: 0))
                move8.append(Move(valueX: -7, valueY: 0))
                
                moves.append(move1)
                moves.append(move2)
                moves.append(move3)
                moves.append(move4)
                moves.append(move5)
                moves.append(move6)
                moves.append(move7)
                moves.append(move8)
                break
            break
            }
            break
        }
        
        delegate?.setupAllMove(chessman: self, moves: moves)
        moves.removeAll()
        
        if (reselect) {
            isFirstSelect = false
        }
    }
}

public enum Kind: String {
    case white = "white"
    case black = "black"
}

public enum ChessType: String {
    case pawn = "pawn"
    case horse = "horse"
    case rook = "rook"
    case elephant = "elephant"
    case king = "king"
    case queen = "queen"
}

protocol ChessManDelegate {
    func setupAllMove(chessman: ChessManView, moves: [[Move]])
}
