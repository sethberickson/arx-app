//
//  GameSession.swift
//  AREA
//
//  Created by Oleg Simonov on 2/17/22.
//

import Foundation

class GameSession: ObservableObject {

    @Published var sessionId: String
    @Published var createdAt: NSDate
    @Published var updatedAt: NSDate
//    @Published var completedTasks: [AWSTask]
    @Published var hasDisplayedLaunchScreen: Bool
    @Published var hasDisplayedWelcomeView: Bool
    @Published var hasDisplayedOnboardingView: Bool
    @Published var robotText = "Let's get started by tapping on a task on the map. As you move around the exhibit, more tasks will show up!"
    

    init(sessionId: String = "",
         createdAt: NSDate = NSDate(),
         updatedAt: NSDate = NSDate(),
//         lastTaskId: [AWSTask] = [],
         hasDisplayedLaunchScreen: Bool = false,
         hasDisplayedWelcomeView: Bool = false,
         hasDisplayedOnboardingView: Bool = false) {
        self.sessionId = sessionId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
//        self.completedTasks = lastTaskId
        self.hasDisplayedLaunchScreen = hasDisplayedLaunchScreen
        self.hasDisplayedWelcomeView = hasDisplayedWelcomeView
        self.hasDisplayedOnboardingView = hasDisplayedOnboardingView
        createGameSession(isNewGame: false)
    }

    func createGameSession(isNewGame: Bool) {
        if isNewGame || UserDefaults.standard.string(forKey: "session_id") == nil || UserDefaults.standard.string(forKey: "session_id") == "" {
            self.sessionId = UUID().uuidString
            self.createdAt = NSDate()
            self.updatedAt = NSDate()
//            self.completedTasks = []
            self.hasDisplayedLaunchScreen = false
            self.hasDisplayedWelcomeView = false
            self.hasDisplayedOnboardingView = false
            UserDefaults.standard.set(self.sessionId, forKey: "session_id")
            UserDefaults.standard.set(self.createdAt, forKey: "created_at")
            UserDefaults.standard.set(self.updatedAt, forKey: "updated_at")
//            UserDefaults.standard.set(self.completedTasks, forKey: "last_task_id")
            UserDefaults.standard.set(self.hasDisplayedWelcomeView, forKey: "has_displayed_welcome_view")
            UserDefaults.standard.set(self.hasDisplayedOnboardingView, forKey: "has_displayed_onboarding_view")
            print("Started new game session")
            printGameSession()
        } else {
            restoreGameSession()
        }
    }

    func restoreGameSession() {
        self.sessionId = UserDefaults.standard.string(forKey: "session_id") ?? ""
        self.createdAt = UserDefaults.standard.object(forKey: "created_at") as! NSDate
        self.updatedAt = UserDefaults.standard.object(forKey: "updated_at") as! NSDate
//        self.completedTasks = UserDefaults.standard.completedTasks
        self.hasDisplayedWelcomeView = UserDefaults.standard.bool(forKey: "has_displayed_welcome_view")
        self.hasDisplayedOnboardingView = UserDefaults.standard.bool(forKey: "has_displayed_onboarding_view")
        print("Restored existing game session")
        printGameSession()
    }

//    func updateGameSession(task: AWSTask) {
//        self.completedTasks.append(task)
//        self.updatedAt = NSDate()
//        UserDefaults.standard.set(self.updatedAt, forKey: "updated_at")
//        UserDefaults.standard.completedTasks = self.completedTasks
//        print("Updated existing game session task")
//    }
    
    // overload of the func above
    func updateGameSession(hasDisplayedLaunchScreen: Bool) {
        self.hasDisplayedLaunchScreen = hasDisplayedLaunchScreen
        self.updatedAt = NSDate()
        UserDefaults.standard.set(self.updatedAt, forKey: "updated_at")
        UserDefaults.standard.set(self.hasDisplayedLaunchScreen, forKey: "has_displayed_launch_screen")
        print("Updated existing game session")
        printGameSession()
    }
    // overload of the func above
    func updateGameSession(hasDisplayedWelcomeView: Bool) {
        self.hasDisplayedWelcomeView = hasDisplayedWelcomeView
        self.updatedAt = NSDate()
        UserDefaults.standard.set(self.updatedAt, forKey: "updated_at")
        UserDefaults.standard.set(self.hasDisplayedWelcomeView, forKey: "has_displayed_welcome_view")
        print("Updated existing game session")
        printGameSession()
    }
    // overload of the func above
    func updateGameSession(hasDisplayedOnboardingView: Bool) {
        self.hasDisplayedOnboardingView = hasDisplayedOnboardingView
        self.updatedAt = NSDate()
        UserDefaults.standard.set(self.updatedAt, forKey: "updated_at")
        UserDefaults.standard.set(self.hasDisplayedOnboardingView, forKey: "has_displayed_onboarding_view")
        print("Updated existing game session")
        printGameSession()
    }

    func printGameSession() {
        print("<-------------------------------------->")
        print("ID: \(self.sessionId)")
        print("Created: \(self.createdAt)")
        print("Updated: \(self.updatedAt)")
//        print("Last task: \(self.completedTasks)")
        print("Launch Screen: \(self.hasDisplayedLaunchScreen)")
        print("Welcome: \(self.hasDisplayedWelcomeView)")
        print("Onboarding: \(self.hasDisplayedOnboardingView)")
        print("<-------------------------------------->")

    }

}

// stack overflow https://stackoverflow.com/a/63368386/15034002
//extension UserDefaults {
//    /// A custom data structure for our completed tasks.
//    var completedTasks: [AWSTask] {
//        get {
//            guard let data = UserDefaults.standard.data(forKey: "last_task_id") else { return [] }
//            return (try? PropertyListDecoder().decode([AWSTask].self, from: data)) ?? []
//        }
//        set {
//            UserDefaults.standard.set(try? PropertyListEncoder().encode(newValue), forKey: "last_task_id")
//        }
//    }
//}

