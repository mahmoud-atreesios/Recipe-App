//
//  OnBoardingScreen.swift
//  Recipe App
//
//  Created by Mahmoud Mohamed Atrees on 13/12/2024.
//

import SwiftUI

struct OnBoardingScreen: View {
    
    @State var pageSelection: Int = 0
    @State var titles = Constant.onboardingTitles
    @State var captions = Constant.onboardingCaptions
    @State var ThreeDimensionsURL = Constant.ThreeDimensionsURL
    
    var body: some View {
        ZStack {
            TabView(selection: $pageSelection) {
                tabViewLogic()
            }
            .tabViewStyle(.page)
            .edgesIgnoringSafeArea(.all)
        }
    }
}

//MARK: - TabView Logic
extension OnBoardingScreen{
    private func tabViewLogic() -> some View{
        ForEach(0..<titles.count, id: \.self) { index in
            OnBoardingScreenUI(TitleOfScreen: titles[index],
                               captionOfScreen: captions[index],
                               url: ThreeDimensionsURL[index],
                               pageIndex: index,
                               pageSelection: $pageSelection)
            .tag(index)
        }
    }
}

#Preview {
    OnBoardingScreen()
}
