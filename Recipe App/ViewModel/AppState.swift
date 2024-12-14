//
//  AppState.swift
//  Recipe App
//
//  Created by Mahmoud Mohamed Atrees on 14/12/2024.
//

import Foundation

class AppState: ObservableObject {
    enum CurrentView {
        case onboarding
        case home
    }
    
    @Published var currentView: CurrentView = .onboarding
}

