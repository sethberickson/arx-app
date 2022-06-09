//
//  LaunchScreen.swift
//  arx-app
//
//  Created by Seth Erickson on 5/31/22.
//

import SwiftUI

struct LaunchScreenView: View {

    @EnvironmentObject var gameSession: GameSession
    @State private var firstPhaseAnimation: Bool = false
    @State private var secondPhaseAnimation: Bool = false
    @State var isAnimatingA: Bool = false
    @State var isAnimatingR: Bool = false
    @State var isAnimatingX: Bool = false
    
    private let timer = Timer.publish(every: 0.85, on: .main, in: .common).autoconnect()
             
    var body: some View {
        ZStack {
            background
            logo
        }
        .onAppear {
                animateA()
                animateR()
                animateX()

            // Currently displays launch screen for exactly 3 seconds. TODO: Change to on data load
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                gameSession.updateGameSession(hasDisplayedLaunchScreen: true)
            }
        }
    }
    
    var background: some View {
        GradientBackground()
    }
    
    var logo: some View {
        VStack {
            ZStack {
                Image("arxCube")
            Image("A")
                .offset(x: isAnimatingA ? -80 : 0, y: isAnimatingA ? -80 : 0)
            Image("R")
                .offset(x: isAnimatingR ? 80 : 0, y: isAnimatingR ? -80 : 0)
            Image("X")
                .offset(x: isAnimatingX ? 0 : 0, y: isAnimatingX ? 80 : 0)
            }
            .rotationEffect(Angle.degrees(firstPhaseAnimation ? 360 : 0)) //makes the box spin
            .scaleEffect(secondPhaseAnimation ? 2 : 1) //UIScreen.main.bounds.size.height * 0.5
            Text("Loading Content...")
        }
    }
    
    func rotateAnimation() {
        guard !firstPhaseAnimation else { return }
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(
                Animation
                    .linear(duration: 5.0)
                    .repeatForever(autoreverses: false)
            ) {
                firstPhaseAnimation.toggle()
            }
        }
    }
    
    func animateA() {
        guard !isAnimatingA else { return }
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(
                Animation
                    .spring()
                    .repeatForever(autoreverses: true)
            ) {
                isAnimatingA.toggle()
            }
        }
    }
    
    func animateR() {
        guard !isAnimatingR else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            withAnimation(
                Animation
                    .spring()
                    .repeatForever(autoreverses: true)
            ) {
                isAnimatingR.toggle()
            }
        }
    }
    
    func animateX() {
        guard !isAnimatingX else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            withAnimation(
                Animation
                    .spring()
                    .repeatForever(autoreverses: true)
            ) {
                isAnimatingX.toggle()
            }
        }
    }
}
