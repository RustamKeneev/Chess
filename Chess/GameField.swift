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
                let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction))
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
            
            print(nextLine)
            
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
    
    private func getCell(x: Int, y: Int) -> UIView {
        return cells[y][x]
    }
    
    private func setupChessmens() {
        for item in 0..<8 {
            let view = UIView()
            view.backgroundColor = .red
            view.tag = 1
            
            getCell(x: item, y: 1).addSubview(view)
            view.snp.makeConstraints { (make) in
                make.center.equalToSuperview()
                make.width.equalTo((width ?? 0.0) - 10.0)
                make.height.equalTo((height ?? 0.0) - 10.0)
            }
        }
        
        for item in 0..<8 {
            let view = UIView()
            view.backgroundColor = .green
            view.tag = 1
            
            getCell(x: item, y: 6).addSubview(view)
            view.snp.makeConstraints { (make) in
                make.center.equalToSuperview()
                make.width.equalTo((width ?? 0.0) - 10.0)
                make.height.equalTo((height ?? 0.0) - 10.0)
            }
        }
    }
    
    private var selectChessmens: UIView? = nil
    
    @objc func checkAction(sender : UITapGestureRecognizer) {
        let selectView = sender.view
        
        if (selectView?.viewWithTag(1) != nil) {
            if !isSelectCell {
                isSelectCell = true
                
                selectChessmens = selectView?.viewWithTag(1)
                
                selectView?.layer.borderColor = UIColor.green.cgColor
                selectView?.layer.borderWidth = 4
            }
        } else if isSelectCell {
            isSelectCell = false
            
            cellsWork.forEach { cell in
                cell.layer.borderWidth = 0
                cell.layer.borderColor = UIColor.clear.cgColor
            }
            
            selectView?.layer.borderColor = UIColor.red.cgColor
            selectView?.layer.borderWidth = 4
            
            if let selectChessmens = selectChessmens {
                selectView?.addSubview(selectChessmens)
                selectChessmens.snp.makeConstraints { (make) in
                    make.center.equalToSuperview()
                    make.width.equalTo((width ?? 0.0) - 10.0)
                    make.height.equalTo((height ?? 0.0) - 10.0)
                }
                
                self.selectChessmens = nil
            }
        }
    }
}
