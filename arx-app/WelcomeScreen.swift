//
//  WelcomeScreen.swift
//  arx-app
//
//  Created by Seth Erickson on 6/6/22.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var gameSession: GameSession
    var body: some View {
        ZStack {
            if !gameSession.hasDisplayedWelcomeView {
                WelcomeScreen()
                    .transition(AnyTransition.modifier(active: SlideTransition(shift: 1000), identity: SlideTransition(shift: 0)))
            } else if gameSession.hasDisplayedWelcomeView && !gameSession.hasDisplayedOnboardingView  {
//                OnboardingView()
                ScanCodeView()
                    .transition(.asymmetric(insertion: AnyTransition.opacity.combined(with: .slide), removal: .scale))
                    .background(ColorConstants.arxNavy)
            } else {
                ScanCodeView()
//                GameNavigationView()
            }
        }
    }
}

struct WelcomeScreen: View {
    @EnvironmentObject var gameSession: GameSession
    @State var animate: Bool = false
    @State var rotationAnimation: Bool = false

    var body: some View {
        GeometryReader() { geometry in
            VStack(alignment: .center) {
                Text("Augmented Reality Experiences")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(ColorConstants.white)
                    .padding(.top, 10)
                Spacer()
                Image("ARX1024")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geometry.size.width * 0.5, height: geometry.size.height * 0.5, alignment: .center)
                    .foregroundColor(ColorConstants.white)
                    .scaleEffect(animate ? 1.1 : 1.0)
                Spacer()
                Button {
                    withAnimation(.easeInOut(duration: 2.9)) {
                        gameSession.updateGameSession(hasDisplayedWelcomeView: true)
                    }
                } label: {
                    Text("START")
                        .foregroundColor(animate ? ColorConstants.white : ColorConstants.white) // CHANGE: animate the "Start" text
                        .font(.system(size: 500))
                        .fontWeight(.bold)
                        .lineLimit(1)
                        .minimumScaleFactor(0.01)
                        .frame(width: geometry.size.width * 0.5, height: geometry.size.height * 0.1)
                        .background(animate ? ColorConstants.arxNavy : ColorConstants.blue5)
                        .cornerRadius(10)
                }
                    .padding(.horizontal, animate ? 10 : 20)
                    .shadow(
                        color: animate ? ColorConstants.blue4 : ColorConstants.blue5,
                        radius: animate ? 30 : 10,
                        x: 0,
                        y: animate ? 20 : 10)
                    .scaleEffect(animate ? 1.1 : 1.0)
                    .offset(y: animate ? 7 : 0)
                Spacer()
                Text("Nora Eccles Harrison Museum of Art") // Replace with Client_Name
                    .foregroundColor(.white)

            } // end of vstack
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .background(GradientBackground())
        } // end of geometry reader
        .onAppear(perform: addAnimation)
        .onAppear(perform: rotateAnimation)
    } // end of view

    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 1.5)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }

    func rotateAnimation() {
        guard !rotationAnimation else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            withAnimation(
                Animation
                    .linear(duration: 9.0)
                    .repeatForever(autoreverses: false)
            ) {
                rotationAnimation.toggle()
            }
        }
    }
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}
