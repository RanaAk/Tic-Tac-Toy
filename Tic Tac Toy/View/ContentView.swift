//
//  ContentView.swift
//  Tic Tac Toy
//
//  Created by RANA  on 12/1/25.
//

import SwiftUI

struct ContentView: View {
    @Bindable var viewModel = GameViewModel()
    @State private var showConfetti = false
    
    var body: some View {
            VStack(spacing: 10) {
                Text(viewModel.winner != nil ? "Winner: \(viewModel.winner!)" : "Turn: \(viewModel.currentPlayer)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.white.gradient)
                    .padding(.top , 60)
                    .padding(.bottom , -40)
                

                VStack(spacing: 5) {
                    ForEach(0..<3, id: \..self) { row in
                        HStack(spacing: 5) {
                            ForEach(0..<3, id: \..self) { col in
                                addButton(viewModel: viewModel, row: row, col: col)
                        
                            }
                        }
                    }
                  
                    
                    if viewModel.winner != nil {
                        resetButton(viewModel: viewModel)
                           .padding(.top , 40)
                           .padding(.bottom , -90)
                        
                    
                    }

                }
                .padding(.top, -40)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight : .infinity)
               // .frame(height : 700)


        }
        //.padding(500)
        .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.indigo]), startPoint: .top, endPoint: .bottom))
        .overlay(alignment: .topLeading) {
            if viewModel.showConfetti {
                withAnimation(.smooth){
                    ParticleView()
                        .ignoresSafeArea()
                }

            }
        }
        
        
        
    }
    
    
}


#Preview {
    ContentView()
}
