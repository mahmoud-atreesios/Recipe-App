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
    @State var url: String = "https://build.spline.design/kSdDtImTdXAWT7Za6KLO/scene.splineswift"
    
    @State var pageIndex: Int = 0
    @Binding var pageSelection: Int
    
    
    var body: some View {
        ZStack {
            Color.onBoardingBackgroundColor
            
            VStack {
                ThreeDimensionImageSection()
                
                titleAndCaption(title: TitleOfScreen, caption: captionOfScreen)
                
                Spacer()
                
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
                .frame(width: .infinity, height: 450)
                .foregroundStyle(Color.onBoardingRectangleColor)
                .clipShape(BottomRoundedRectangle(radius: 50))
            
            ThreeDimensionImage(url: $url)
                .frame(width: .infinity, height: 450)
                .clipShape(BottomRoundedRectangle(radius: 50))
            
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 200, height: 50)
                .foregroundStyle(Color.onBoardingRectangleColor)
                .offset(x: 90, y: 180)
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
        .opacity(pageSelection == pageIndex ? 1 : 0)
        .animation(.easeInOut(duration: 0.5), value: pageSelection)
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
                    .foregroundColor(Color.onBoardingBackgroundColor)
                    .shadow(radius: 7)
                    .overlay(
                        Text("Get Started")
                            .foregroundColor(.white)
                            .bold()
                    )
            }
            .opacity(pageSelection == pageIndex ? 1 : 0)
            .animation(.easeOut, value: pageSelection)
            .padding()
        }else {
            Button {
                withAnimation(.easeInOut) {
                    pageSelection += 1
                }
            } label: {
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 180, height: 55)
                    .foregroundColor(Color.onBoardingBackgroundColor)
                    .shadow(radius: 7)
                    .overlay(
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.title2)
                            .bold()
                    )
            }
            .opacity(pageSelection == pageIndex ? 1 : 0)
            .animation(.easeOut, value: pageSelection)
            .padding()
        }
    }
}


//MARK: - Spline setup
struct ThreeDimensionImage: View {
    
    @Binding var url: String
    
    var body: some View {
        
        let url = URL(string: url)!
        SplineView(sceneFileURL: url).ignoresSafeArea(.all)
    }
}

#Preview {
    OnBoardingScreenUI(pageSelection: OnBoardingScreen().$pageSelection)
}

