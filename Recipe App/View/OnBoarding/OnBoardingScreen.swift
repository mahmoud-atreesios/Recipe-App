//
//  OnBoardingScreen.swift
//  Recipe App
//
//  Created by Mahmoud Mohamed Atrees on 13/12/2024.
//

import SwiftUI

struct OnBoardingScreen: View {
    
    @State var pageSelection: Int = 0
    
    @State var titles = ["Explore Recipes","Utilize LeftOvers","Share Recipes"]
    @State var captions = ["We provide recipes based on what you have on hand","Start with ingredients that you have in kitchen","You can invite your partner to cook with you"]
    
    var body: some View {
        ZStack {
            TabView(selection: $pageSelection) {
                ForEach(0..<titles.count, id: \.self) { index in
                    OnBoardingScreenUI(TitleOfScreen: titles[index],
                                       captionOfScreen: captions[index],
                                       pageSelection: $pageSelection)
                }
            }
            .tabViewStyle(.page)
            .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    OnBoardingScreen()
}
