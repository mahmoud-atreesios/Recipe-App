//
//  OnBoardingScreen.swift
//  Recipe App
//
//  Created by Mahmoud Mohamed Atrees on 13/12/2024.
//

import SwiftUI

struct OnBoardingScreen: View {
    
    @State var pageSelection: Int = 0
    
    @State var titles = ["Explore Recipes!","Utilize LeftOvers","Share Recipes!"]
    @State var captions = ["Dive into a world of culinary inspiration with Explore Recipes. Whether you're a seasoned chef or a beginner in the kitchen, this feature invites you to discover an array of delightful dishes from around the globe.",
                           "Turn yesterday's meals into today's culinary masterpieces with Utilize Leftovers. Discover creative and delicious ways to repurpose your leftovers into fresh, satisfying dishes. Get inspired to give your leftovers a tasty second life and make every bite count!",
                           "Spread the joy of cooking with Share Recipes. Whether it’s a family favorite, a secret ingredient masterpiece, or a quick weekday delight. Cooking is better when shared!"]
    
    @State var ThreeDimensionsURL = ["https://build.spline.design/kSdDtImTdXAWT7Za6KLO/scene.splineswift",
                                     "https://build.spline.design/1vDOGeVRwLQj2E9o9xmX/scene.splineswift",
                                     "https://build.spline.design/DUhZVZ6Q05TdE6f41AAS/scene.splineswift"
    ]
    
    var body: some View {
        ZStack {
            TabView(selection: $pageSelection) {
                ForEach(0..<titles.count, id: \.self) { index in
                    OnBoardingScreenUI(TitleOfScreen: titles[index],
                                       captionOfScreen: captions[index],
                                       url: ThreeDimensionsURL[index],
                                       pageIndex: index,
                                       pageSelection: $pageSelection)
                    .tag(index)
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
