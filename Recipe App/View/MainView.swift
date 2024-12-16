//
//  MainView.swift
//  Recipe App
//
//  Created by Mahmoud Mohamed Atrees on 15/12/2024.
//

import SwiftUI

struct MainView: View {
    
    @State var buttonTapped: Bool = true
    
    var body: some View {
        ZStack {
            if !buttonTapped {
                Text("Hello, Mahmoud!")
            } else {
                HomeScreen()
            }
            VStack {
                Spacer()
                customTabBar()
            }
            .padding(.bottom, 30)
            .ignoresSafeArea()
        }
    }
}

//MARK: - Custom Tab Bar
extension MainView {
    private func customTabBar() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 50)
                .frame(width: .infinity, height: 60)
                .foregroundColor(.white)
                .shadow(radius: 10)
                .padding(.horizontal, 40)
            
            HStack {
                RoundedRectangle(cornerRadius: 50)
                    .frame(width: UIScreen.main.bounds.width / 2 - 30, height: 60)
                    .foregroundColor(Color.onBoardingRectangleColor)
                    .offset(x: buttonTapped ==  false ? 80 : -80)
                    .animation(.spring, value: buttonTapped)
            }
            .padding(.horizontal, 20)
            
            HStack {
                Button {
                    buttonTapped = true
                } label: {
                    Image(systemName: "house.fill")
                        .foregroundColor(buttonTapped ? .seeAllColor : .tabBarItemColor)
                }
                
                Spacer()
                Button {
                    buttonTapped = false
                } label: {
                    Image(systemName: "person.fill")
                        .foregroundColor(buttonTapped ? .tabBarItemColor : .seeAllColor)
                }

            }
            .font(.title2)
            .foregroundStyle(.gray)
            .padding(.horizontal, 100)
        }
    }
}

#Preview {
    MainView()
}

