//
//  RecommendationUI.swift
//  Recipe App
//
//  Created by Mahmoud Mohamed Atrees on 15/12/2024.
//

import SwiftUI

struct RecommendationUI: View {
    
    @State var imageName: String = "creamyPasta"
    @State var foodName: String = "Creamy Pasta"
    @State var cooker: String = "By David Charles"

    
    var body: some View {
        VStack(alignment: .leading) {
            
            Button {
                print("Food image tapped")
            } label: {
                Image(imageName)
                    .resizable()
                    .frame(width: 180, height: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
            }
            
            VStack(alignment: .leading) {
                Text(foodName)
                    .frame(width: 180,alignment: .leading)
                Text("By \(cooker)")
                    .frame(width: 180,alignment: .leading)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
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
