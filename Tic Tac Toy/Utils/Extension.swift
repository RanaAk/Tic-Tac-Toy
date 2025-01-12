//
//  Extension.swift
//  Tic Tac Toy
//
//  Created by RANA  on 12/1/25.
//

import SwiftUI

extension Color {
    static func random() -> Color {
        Color(
            red: Double.random(in: 0...1),
            green: Double.random(in: 0...1),
            blue: Double.random(in: 0...1)
        )
    }
}
