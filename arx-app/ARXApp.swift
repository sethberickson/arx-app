//
//  ARXApp.swift
//  arx-app
//
//  Created by Seth Erickson on 6/3/22.
//

import SwiftUI
import AVFAudio

@main
struct ARXApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
//    @StateObject var placementSettings = PlacementSettings()
//    @StateObject var gameSession = GameSession()
//    @StateObject var beaconController = BeaconController()
    
    @StateObject var gameSession = GameSession()
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if !gameSession.hasDisplayedLaunchScreen {
                        LaunchScreenView()
                        .transition(.asymmetric(insertion: AnyTransition.opacity.combined(with: .slide), removal: .scale))
                        .onAppear { // for testing purposes only. REMOVE
                            gameSession.createGameSession(isNewGame: true)
                        }
                } else {
                    WelcomeView()
                }
            }
            .environmentObject(gameSession)
//                .environmentObject(placementSettings)
//                .environmentObject(gameSession)
//                .environmentObject(beaconController)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var orientationLock = UIInterfaceOrientationMask.landscapeRight
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return self.orientationLock
    }
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
}
