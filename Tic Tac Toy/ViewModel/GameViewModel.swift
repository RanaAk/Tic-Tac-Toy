//
//  GameViewModel.swift
//  Tic Tac Toy
//
//  Created by RANA  on 12/1/25.
//

import Foundation
import Observation

@Observable
class GameViewModel {
    
    var board : [[String]] = Array(repeating: Array(repeating: "", count: 3), count: 3)
    var currentPlayer = "X"
    var winner : String? = nil
    var showConfetti = false
    
    
    init(){
        
    }
        
    func makeMove(row : Int , col : Int){
        guard board[row][col] == "", winner == nil else { return }
        
        board[row][col] = currentPlayer
        if checkWin(for: currentPlayer){
            winner = currentPlayer
        } else if checkDraw(){
            winner = "Draw"
        } else {
            switchPlayer()
        }
        
    }
    
    func checkDraw() -> Bool{
        
        return board.flatMap({ $0 })
            .allSatisfy({ !$0.isEmpty})
        
    }
    
    func switchPlayer(){
        currentPlayer = (currentPlayer == "X") ? "0" : "X"
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            self.computerMove()
        }
    }
    
    func computerMove(){
        guard winner == nil else { return }
        currentPlayer = "0"
        let Emptyslots  = calculateEmptyslots().shuffled()
        
        if let randomSlot = Emptyslots.randomElement() {
            let (rowIndex, colIndex) = randomSlot
            board[rowIndex][colIndex] = "0"
        }
        
        if checkWin(for: currentPlayer){
            winner = currentPlayer
        } else if checkDraw(){
            winner = "Draw"
        } else {
            currentPlayer = "X"
        }
        
    }
    
    func calculateEmptyslots() -> [(Int, Int)] {
        var Emptyslots : [(Int, Int)] = []
        for (rowIndex, row) in board.enumerated() {
            for (colIndex, _) in row.enumerated() {
                if currentPlayer == "0"  {
                    if board[rowIndex][colIndex].isEmpty {
                        Emptyslots.append((rowIndex,colIndex))
                    }
                }
            }
        }
        return Emptyslots
    }


    
    func checkWin(for player : String) -> Bool {
        
        let winningLines = [
            [(0, 0), (0, 1), (0, 2)],
            [(1, 0), (1, 1), (1, 2)],
            [(2, 0), (2, 1), (2, 2)],
            
            
            [(0, 0), (1, 0), (2, 0)],
            [(0, 1), (1, 1), (2, 1)],
            [(0, 2), (1, 2), (2, 2)],
            
            // Diagnoals
            
            [(0,0),(1,1),(2,2)],
            [(0,2),(1,1),(2,0)]
            
        ]
        
        if winningLines.contains(where: { line  in
            line.allSatisfy { (row , col) in
               
                board[row][col] == player
                
            }
        }){
            
            showConfetti = true
            return true
        }
        else {
            
            return false
        }
    }
    

    
    func  resetGame(){
        board = Array(repeating: Array(repeating: "", count: 3), count: 3)
        currentPlayer = "X"
        winner = nil
        showConfetti = false
    }
}
