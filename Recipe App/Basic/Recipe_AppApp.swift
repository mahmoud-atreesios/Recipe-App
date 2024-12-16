//
//  Recipe_AppApp.swift
//  Recipe App
//
//  Created by Mahmoud Mohamed Atrees on 12/12/2024.
//

import SwiftUI

@main
struct Recipe_AppApp: App {
    
    // use this approach when we are checking is signed in or not
    //@AppStorage("isSignedIn") var isSignedIn: Bool?
    
    @AppStorage("rootHomeScreen") var rootHomeScreen: Bool?
    @AppStorage("hasLaunchedBefore") var hasLaunchedBefore: Bool = false

    @StateObject var appState = AppState()
        
    init() {
        if !hasLaunchedBefore {
            rootHomeScreen = false
            hasLaunchedBefore = true
        }
    }
    
    var body: some Scene {
        WindowGroup {
            if appState.currentView == .onboarding && rootHomeScreen == false {
                OnBoardingScreen()
                    .environmentObject(appState)
            }else {
                MainView()
                    .environmentObject(appState)
            }
        }
    }
}
