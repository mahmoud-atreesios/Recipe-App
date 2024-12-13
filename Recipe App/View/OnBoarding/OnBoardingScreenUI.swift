//
//  OnBoardingScreenUI.swift
//  Recipe App
//
//  Created by Mahmoud Mohamed Atrees on 13/12/2024.
//

import SwiftUI
import SplineRuntime

struct OnBoardingScreenUI: View {
    
    @State var TitleOfScreen: String = "Title of Onboarding"
    @State var captionOfScreen: String = "caption of the onboarding screen goes here caption of the onboarding screen goes here caption of the onboarding screen goes here"
    
    @Binding var pageSelection: Int
    
    var body: some View {
        ZStack {
            Color.onBoardingBackgroundColor
            
            VStack {
                ThreeDimensionImageSection()
                
                titleAndCaption(title: TitleOfScreen, caption: captionOfScreen)
                
                showButton()
                
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

//MARK: - 3D figure setup
extension OnBoardingScreenUI {
    private func ThreeDimensionImageSection() -> some View {
        ZStack {
            
            Rectangle()
                .frame(width: .infinity, height: 550)
                .foregroundStyle(Color.onBoardingRectangleColor)
                .clipShape(BottomRoundedRectangle(radius: 50))
            
            ThreeDimensionImage()
                .frame(width: .infinity, height: 550)
                .clipShape(BottomRoundedRectangle(radius: 50))
            
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 200, height: 50)
                .foregroundStyle(Color.onBoardingRectangleColor)
                .offset(x: 90, y: 230)
        }
    }
}

//MARK: - Title and Caption setup
extension OnBoardingScreenUI {
    private func titleAndCaption(title: String, caption: String) -> some View {
        VStack {
            Text(title)
                .font(.title)
                .foregroundStyle(.white)
                .padding(.vertical, 10)
            Text(caption)
                .font(.headline)
                .foregroundStyle(.white)
        }
        .padding(.horizontal, 10)
        .bold()
    }
}

//MARK: - Show Button logic
extension OnBoardingScreenUI {
    @ViewBuilder
    private func showButton() -> some View {
        if pageSelection == 2 {
            Button {
                print("Go to Home Screen")
            } label: {
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 210, height: 60)
                    .foregroundColor(Color.getStartedButtonColor)
                    .overlay(
                        Text("Get Started")
                            .foregroundColor(.white)
                            .bold()
                    )
            }
            .padding()
        }
    }
}


//MARK: - Spline setup
struct ThreeDimensionImage: View {
    var body: some View {
        let url = URL(string: "https://build.spline.design/1vDOGeVRwLQj2E9o9xmX/scene.splineswift")!
        SplineView(sceneFileURL: url).ignoresSafeArea(.all)
    }
}

#Preview {
    OnBoardingScreenUI(pageSelection: OnBoardingScreen().$pageSelection)
}

