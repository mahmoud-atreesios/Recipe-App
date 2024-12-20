//
//  RecommendationUI.swift
//  Recipe App
//
//  Created by Mahmoud Mohamed Atrees on 15/12/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct RecommendationUI: View {
    
    @State var imageUrl: String?
    @State var foodName: String = "Creamy Pasta"
    @State var cooker: [Credit]?

    
    var body: some View {
        VStack(alignment: .leading) {
            
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 180, height: 250)
                    .foregroundStyle(Color.mainAppBackground)
                
                if let imageUrl = imageUrl{
                    WebImage(url: URL(string: imageUrl))
                        .resizable()
                        //.scaledToFill()
                        .frame(width: 180, height: 250)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                }else {
                    Image("creamyCajunPasta")
                        .resizable()
                        //.scaledToFill()
                        .frame(width: 180, height: 250)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
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
        //.padding(.leading, 25)
    }
}

#Preview {
    RecommendationUI()
}
