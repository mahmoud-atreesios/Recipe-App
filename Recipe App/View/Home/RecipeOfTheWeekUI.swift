//
//  RecipeOfTheWeekUI.swift
//  Recipe App
//
//  Created by Mahmoud Mohamed Atrees on 15/12/2024.
//

import SwiftUI

struct RecipeOfTheWeekUI: View {
    
    @State var imageUrl: String = "https://picsum.photos/300"
    @State var foodName: String = "Creamy Pasta"
    @State var cooker: [Credit]?

    
    var body: some View {
        ZStack {
            Button {
                print("Food image tapped")
            } label: {
                AsyncImage(url: URL(string: imageUrl)) { recipeImage in
                    recipeImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300, height: 270)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .overlay {
                            LinearGradient(colors: [.black,.white.opacity(0)], startPoint: .bottom, endPoint: .center)
                                .frame(width: 300, height: 270)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                        }
                } placeholder: {
                    ProgressView()
                }
            }
            
            VStack{
                Spacer()
                Text(foodName)
                    .foregroundStyle(.white)

                if let cookerName = cooker?.first?.name {
                    Text("By \(cookerName)")
                        .font(.footnote)
                        .foregroundStyle(Color(red: 242 / 255, green: 249 / 255, blue: 255 / 255))

                }else {
                    Text("By Charles Johnson")
                        .font(.footnote)
                        .foregroundStyle(Color(red: 242 / 255, green: 249 / 255, blue: 255 / 255))

                }
            }
            .frame(width: 300, height: 250)
            .bold()
        }
    }
}

#Preview {
    RecipeOfTheWeekUI()
}
