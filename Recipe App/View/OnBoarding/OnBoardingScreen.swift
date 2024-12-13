//
//  OnBoardingScreen.swift
//  Recipe App
//
//  Created by Mahmoud Mohamed Atrees on 13/12/2024.
//

import SwiftUI

struct OnBoardingScreen: View {
    
    @State var pageSelection: Int = 0
    
    var body: some View {
        ZStack {
            TabView(selection: $pageSelection) {
                ZStack {
                    Color.blue
                }
                ZStack {
                    Color.black
                }
            }
            .tabViewStyle(.page)
            //.edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    OnBoardingScreen()
}
