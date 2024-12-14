//
//  OnBoardingScreenUI.swift
//  Recipe App
//
//  Created by Mahmoud Mohamed Atrees on 13/12/2024.
//

import SwiftUI
import SplineRuntime

struct OnBoardingScreenUI: View {
    
    @AppStorage("rootHomeScreen") var rootHomeScreen = false

    @EnvironmentObject var appState: AppState
    
    @State var TitleOfScreen: String = "Title of Onboarding"
    @State var captionOfScreen: String = "caption of the onboarding screen goes here caption of the onboarding screen goes here caption of the onboarding screen goes here"
    @State var url: String = "https://build.spline.design/kSdDtImTdXAWT7Za6KLO/scene.splineswift"
    
    @State var pageIndex: Int = 0
    @Binding var pageSelection: Int
    
    
    var body: some View {
        ZStack {
            Color.white
            
            VStack {
                ThreeDimensionImageSection()
                    .padding(.top, 15)
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
            ThreeDimensionImage(url: $url)
                .frame(width: 340, height: 450)
                .clipShape(Circle())
        }
    }
}

//MARK: - Title and Caption setup
extension OnBoardingScreenUI {
    private func titleAndCaption(title: String, caption: String) -> some View {
        VStack() {
            Text(title)
                .font(.title)
                .foregroundStyle(.black)
                .padding(.vertical, 10)
            Text(caption)
                .font(.headline)
                .foregroundStyle(.black)
                .multilineTextAlignment(.center)
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
                appState.currentView = .home
                rootHomeScreen = true
            } label: {
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 210, height: 60)
                    .foregroundColor(Color.onBoardingBackgroundColor)
                    .shadow(radius: 7)
                    .overlay(
                        Text("Get Started")
                            .foregroundColor(.white)
                            .font(.title3)
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
                            .font(.title3)
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

