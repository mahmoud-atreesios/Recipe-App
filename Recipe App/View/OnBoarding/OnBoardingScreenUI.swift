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
    
    private let backgroundColor = Color(red: 133 / 255, green: 169 / 255, blue: 143 / 255)
    private let rectangleColor = Color(red: 211 / 255, green: 241 / 255, blue: 223 / 255)
    
    var body: some View {
        ZStack {
            
            backgroundColor
            
            VStack {
                ThreeDimensionImageSection()
                Spacer()
                
                titleAndCaption(title: TitleOfScreen, caption: captionOfScreen)
                Spacer()
                    .padding()
            }
        }
        .ignoresSafeArea()
    }
}

//MARK: - 3D figure setup
extension OnBoardingScreenUI {
    private func ThreeDimensionImageSection() -> some View {
        ZStack {
            ThreeDimensionImage()
                .frame(width: .infinity, height: 550)
                .foregroundStyle(.gray)
                .cornerRadius(50)
            
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 200, height: 50)
                .foregroundStyle(rectangleColor)
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

//MARK: - Spline setup
struct ThreeDimensionImage: View {
    var body: some View {
        let url = URL(string: "https://build.spline.design/1vDOGeVRwLQj2E9o9xmX/scene.splineswift")!
        SplineView(sceneFileURL: url).ignoresSafeArea(.all)
    }
}

#Preview {
    OnBoardingScreenUI()
}
