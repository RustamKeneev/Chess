//
//  GameField.swift
//  Chess
//
//  Created by Rustam Keneev on 13/11/21.
//

import Foundation
import SnapKit
import UIKit

class GameField: UIView {
    
    private let countTableX = 8
    private let countTableY = 8

    private var width: Double? = nil
    private var height: Double? = nil

    private var cellsWork: [UIView] = []
    
    private var cells: [[UIView]] = []
    private var isSelectCell = false
    
    private var currentMoveChessKind = true
    
    override func layoutSubviews() {
        setupSizeCell()
        setupCell()
        setupView()
        setupChessmens()
    }
    
    private func setupSizeCell() {
        height = Double(frame.height) / Double(countTableY)
        width = Double(frame.width) / Double(countTableX)
    }
    
    private func setupCell() {
        for coordinateY in 0..<(countTableY) {
            for coordinateX in 0..<(countTableX) {
                let view = UIView()
                cellsWork.append(view)
                let gesture = UITapGestureRecognizer(target: self, action: #selector(self.checkAction))
                view.addGestureRecognizer(gesture)
                
                addSubview(view)
                view.snp.makeConstraints { (make) in
                    make.width.equalTo(width ?? 0)
                    make.height.equalTo(height ?? 0)
                    make.top.equalToSuperview().offset(Double(coordinateY) * (height ?? 0.0))
                    make.left.equalToSuperview().offset(Double(coordinateX) * (width ?? 0.0))
                }
            }
        }
        
        var cellsCounter = 0
        var nextLine = true
        
        for (index, view) in cellsWork.enumerated() {
            if (cellsCounter >= countTableX) {
                cellsCounter = 0
                
                if nextLine {
                    nextLine = false
                } else {
                    nextLine = true
                }
            }
                        
            if nextLine {
                if (index % 2) == 1 {
                    view.backgroundColor = .black
                }
            } else {
                if (index % 2) == 0 {
                    view.backgroundColor = .black
                }
            }
            
            cellsCounter = cellsCounter + 1
        }
        
        assert(cellsWork.count % countTableX == 0)
        cells = stride(from: 0, to: cellsWork.count, by: countTableX).map { Array(cellsWork[$0..<$0+countTableX]) }
    }
    
    private func setupView() {
        layer.borderWidth = 2
        layer.borderColor = UIColor.black.cgColor
    }
    
    private func getCell(x: Int, y: Int) -> UIView? {
       if x < countTableX && y < countTableY && x >= 0 && y >= 0 {
            return cells[y][x]
        } else {
            return nil
        }
    }
    
    private func getCoordinateChassMan(chessman: ChessManView) -> (Int, Int) {
        for (indexOne, array) in cells.enumerated() {
            for (indexTwo, view) in array.enumerated() {
                let chessMan = view.viewWithTag(1) as? ChessManView
                
                if chessMan != nil && (chessMan?.id ?? 0) == chessman.id {
                    return (indexTwo, indexOne)
                }
            }
        }
        
        return (0, 0)
    }
    
    private func setupChessmens() {
        for item in 0..<8 {
            createChess(x: item, y: 1, kind: .black, chessType: .pawn)
        }
        
        createChess(x: 1, y: 0, kind: .black, chessType: .horse)
        createChess(x: 6, y: 0, kind: .black, chessType: .horse)

        createChess(x: 0, y: 0, kind: .black, chessType: .rook)
        createChess(x: 7, y: 0, kind: .black, chessType: .rook)
        
        createChess(x: 2, y: 0, kind: .black, chessType: .elephant)
        createChess(x: 5, y: 0, kind: .black, chessType: .elephant)
        
        createChess(x: 3, y: 0, kind: .black, chessType: .king)
        createChess(x: 4, y: 0, kind: .black, chessType: .queen)

        for item in 0..<8 {
            createChess(x: item, y: 6, kind: .white, chessType: .pawn)
        }
        
        createChess(x: 1, y: 7, kind: .white, chessType: .horse)
        createChess(x: 6, y: 7, kind: .white, chessType: .horse)
        
        createChess(x: 0, y: 7, kind: .white, chessType: .rook)
        createChess(x: 7, y: 7, kind: .white, chessType: .rook)

        createChess(x: 2, y: 7, kind: .white, chessType: .elephant)
        createChess(x: 5, y: 7, kind: .white, chessType: .elephant)
        
        createChess(x: 3, y: 7, kind: .white, chessType: .king)
        createChess(x: 4, y: 7, kind: .white, chessType: .queen)
    }
    
    private func createChess(x: Int, y: Int , kind: Kind, chessType: ChessType) {
        let chessman = ChessManView(delegate: self, kind: kind, chessType: chessType)
        
        getCell(x: x, y: y)?.addSubview(chessman)
        chessman.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo((width ?? 0.0))
            make.height.equalTo((height ?? 0.0))
        }
    }
    
    private var selectChessmens: ChessManView? = nil
    
    @objc func checkAction(sender: UITapGestureRecognizer) {
        let selectView = sender.view
        
                
        if (selectView?.viewWithTag(1) != nil && currentMoveChessKind == (selectView?.viewWithTag(1) as? ChessManView)?.types) {
            let chessman = selectView?.viewWithTag(1) as? ChessManView
            
            if chessman?.types == currentMoveChessKind {
                currentMoveChessKind = !currentMoveChessKind
                
                isSelectCell = true
                
                cellsWork.forEach { cell in
                    cell.layer.borderWidth = 0
                    cell.layer.borderColor = UIColor.clear.cgColor
                }
                
                selectChessmens = chessman
                
                selectChessmens?.select()
                
                selectView?.layer.borderColor = UIColor.green.cgColor
                selectView?.layer.borderWidth = 4
            }
        } else if isSelectCell && (selectView?.viewWithTag(1) as? ChessManView)?.types == selectChessmens?.types {
            isSelectCell = false
            
            if let view = (selectView?.viewWithTag(1) as? ChessManView) {
                selectView?.willRemoveSubview(view)
            }
            
            if let selectChessmens = selectChessmens {
                selectView?.addSubview(selectChessmens)
                selectChessmens.snp.makeConstraints { (make) in
                    make.center.equalToSuperview()
                    make.width.equalTo((width ?? 0.0))
                    make.height.equalTo((height ?? 0.0))
                }
                
                self.selectChessmens = nil
            }
            
            cellsWork.forEach { cell in
                cell.layer.borderWidth = 0
                cell.layer.borderColor = UIColor.clear.cgColor
            }
        } else if isSelectCell && (selectView?.layer.borderWidth ?? 0) == 4 {
            isSelectCell = false
            
            cellsWork.forEach { cell in
                cell.layer.borderWidth = 0
                cell.layer.borderColor = UIColor.clear.cgColor
            }
            
            if let selectChessmens = selectChessmens {
                selectView?.addSubview(selectChessmens)
                selectChessmens.snp.makeConstraints { (make) in
                    make.center.equalToSuperview()
                    make.width.equalTo((width ?? 0.0))
                    make.height.equalTo((height ?? 0.0))
                }
                
                self.selectChessmens = nil
            }
        }
    }
}

extension GameField: ChessManDelegate {
    func setupAllMove(chessman: ChessManView, moves: [[Move]]) {
        moves.forEach { move in
            checkPositions(chessman: chessman, moves: move)
        }
    }
    
    private func checkPositions(chessman: ChessManView, moves: [Move]) {
        let coordinate = getCoordinateChassMan(chessman: chessman)
        
        if chessman.chessType == .horse {
            for move in moves {
                let coordinateMove = Move(valueX: coordinate.0 - move.valueX, valueY: coordinate.1 - move.valueY)
                
                let cell = getCell(x: coordinateMove.valueX, y: coordinateMove.valueY)
                
                if (cell?.viewWithTag(1) as? ChessManView) == nil {
                    cell?.layer.borderColor = UIColor.red.cgColor
                    cell?.layer.borderWidth = 4
                }
            }
        } else {
            for move in moves {
                let coordinateMove = Move(valueX: coordinate.0 - move.valueX, valueY: coordinate.1 - move.valueY)
                
                let cell = getCell(x: coordinateMove.valueX, y: coordinateMove.valueY)
                
                if (cell?.viewWithTag(1) as? ChessManView) != nil {
                    break
                } else {
                    cell?.layer.borderColor = UIColor.red.cgColor
                    cell?.layer.borderWidth = 4
                }
            }
        }
    }
}
