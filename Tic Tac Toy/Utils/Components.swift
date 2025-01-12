//
//  Components.swift
//  Tic Tac Toy
//
//  Created by RANA  on 12/1/25.
//

import SwiftUI

@ViewBuilder
func resetButton(viewModel : GameViewModel) -> some View {
    Button("Reset Game") {
        viewModel.resetGame()
    }
    .font(.title2)
    .padding()
    .background(LinearGradient(gradient: Gradient(colors: [Color.green, Color.teal]), startPoint: .top, endPoint: .bottom))
    .foregroundColor(.white)
    .clipShape(RoundedRectangle(cornerRadius: 12))
    .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
    .padding()
}

@ViewBuilder
func addButton(viewModel : GameViewModel , row : Int , col : Int ) -> some View {
    Button(action: {
        viewModel.makeMove(row: row, col: col)
    }) {
        ZStack {
            Rectangle()
                .stroke(Color.white.gradient, lineWidth: 4)
                .frame(width: 115, height: 115)
                

            Text(viewModel.board[row][col])
                .font(.system(size: 48, weight: .bold))
                .foregroundStyle(.white.gradient)
        }
        .foregroundStyle(.white.gradient)
    }
    .disabled(viewModel.board[row][col] != "" || viewModel.winner != nil || viewModel.currentPlayer == "O")
}
