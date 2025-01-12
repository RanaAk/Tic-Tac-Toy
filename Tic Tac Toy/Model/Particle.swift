//
//  Particle.swift
//  Tic Tac Toy
//
//  Created by RANA  on 12/1/25.
//

import Foundation
import SwiftUI

struct Particle: Identifiable {
    let id: UUID
    var position: CGPoint
    var size: CGFloat
    var color: Color
    var opacity: Double
}
