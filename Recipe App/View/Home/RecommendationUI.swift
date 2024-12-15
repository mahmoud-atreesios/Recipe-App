//
//  RecommendationUI.swift
//  Recipe App
//
//  Created by Mahmoud Mohamed Atrees on 15/12/2024.
//

import SwiftUI

struct RecommendationUI: View {
    
    @State var imageUrl: String = "https://picsum.photos/250"
    @State var foodName: String = "Creamy Pasta"
    @State var cooker: [Credit]?

    
    var body: some View {
        VStack(alignment: .leading) {
            
            Button {
                print("Food image tapped")
            } label: {
                AsyncImage(url: URL(string: imageUrl)) { recipeImage in
                    recipeImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 180, height: 250)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                } placeholder: {
                    ProgressView()
                }
            }

            
            VStack(alignment: .leading) {
                Text(foodName)
                    .frame(width: 180,alignment: .leading)
                
                if let cookerName = cooker?.first?.name {
                    Text("By \(cookerName)")
                        .frame(width: 180,alignment: .leading)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }else {
                    Text("By Charles Johnson")
                        .frame(width: 180,alignment: .leading)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                
            }
            
            .bold()
            .padding(.leading, 10)
            Spacer()
        }
        .padding(.leading, 25)
    }
}

#Preview {
    RecommendationUI()
}
