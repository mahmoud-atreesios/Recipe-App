//
//  HomeScreen.swift
//  Recipe App
//
//  Created by Mahmoud Mohamed Atrees on 14/12/2024.
//

import SwiftUI

struct HomeScreen: View {
    
    @AppStorage("rootHomeScreen") var rootHomeScreen: Bool?
    
    @State var sth: String = ""
    
    var body: some View {
        ZStack {
            
            Color.mainAppBackground.ignoresSafeArea()
            
            VStack(alignment: .leading) {
                headerView()
                searchBar()
                Spacer()
            }
        }
    }
}

//MARK: - Header UI
extension HomeScreen{
    private func headerView() -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Hello, Mahmoud")
                    .fontDesign(.monospaced)
                    .foregroundStyle(.gray)
                Text("What would you like to cook today?")
                    .frame(width: 220, height: 60)
                    .font(.title2)
                    .bold()
            }
            .padding(.leading, 30)
            .padding(.bottom, 20)
            Spacer()
            Image("profileImage")
                .resizable()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .padding(.trailing, 25)
        }
    }
}

//MARK: - Search Bar UI
extension HomeScreen {
    private func searchBar() -> some View {
        ZStack {
            TextField("Search any recipes", text: $sth)
                .padding(.leading, 15)
                .frame(width: 330, height: 50)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 10)
            
            HStack {
                Spacer()
                Button {
                    print("Search button image pressed")
                } label: {
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .foregroundStyle(.gray)
                        .bold()
                }
                .padding(.trailing, 50)
            }
            
        }
    }
}

#Preview {
    HomeScreen()
}
