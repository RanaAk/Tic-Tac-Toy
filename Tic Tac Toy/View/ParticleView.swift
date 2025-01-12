//
//  ParticleView.swift
//  Tic Tac Toy
//
//  Created by RANA  on 12/1/25.
//

import SwiftUI

struct ParticleView: View {
    @State private var particles: [Particle] = []

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(particles) { particle in
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(particle.color)
                        .frame(width: particle.size, height: particle.size)
                        .position(particle.position)
                      
                    Circle()
                        .fill(particle.color)
                        .frame(width: particle.size , height: particle.size)
                        .position(particle.position)
                        .opacity(particle.opacity)
                    Rectangle()
                        .fill(particle.color)
                        .frame(width: particle.size , height: particle.size)
                        .position(particle.position)
                        .opacity(particle.opacity)
                }
            }
            .task{
                startParticles(in: geometry.size)
            }
        }
    }

    private func startParticles(in size: CGSize) {
        for _ in 0..<200 {
            let xPosition = CGFloat.random(in: 0..<size.width)
            let yPosition = CGFloat.random(in: -200..<0)
            let particle = Particle(
                id: UUID(),
                position: CGPoint(x: xPosition, y: yPosition),
                size: CGFloat.random(in: 5..<12),
                color: Color.random(),
                opacity: 1.0
            )
            
            withAnimation(.smooth(duration: Double.random(in: 2...4))) {
                particles.append(particle)
            }
        }

      
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            particles = particles.map { particle in
                var updatedParticle = particle
                updatedParticle.position.y += 15
                updatedParticle.opacity -= 0.02
                return updatedParticle
            }.filter { $0.opacity > 0 }

            if particles.isEmpty {
                timer.invalidate()
            }
        }
    }
}

#Preview {
    ParticleView()
}
