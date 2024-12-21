//
//  RecipeOfTheWeekUI.swift
//  Recipe App
//
//  Created by Mahmoud Mohamed Atrees on 15/12/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct RecipeOfTheWeekUI: View {
    
    @State var imageUrl: String = "https://picsum.photos/300"
    @State var foodName: String = "Creamy Pasta"
    @State var cooker: [Credit]?

    
    var body: some View {
        ZStack {
            
            WebImage(url: URL(string: imageUrl))
                .resizable()
                //.scaledToFill()
                .frame(width: 300, height: 270)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .overlay {
                    LinearGradient(colors: [.black,.white.opacity(0)], startPoint: .bottom, endPoint: .center)
                        .frame(width: 300, height: 270)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
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
