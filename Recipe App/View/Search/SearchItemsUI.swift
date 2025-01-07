//
//  SearchItemsUI.swift
//  Recipe App
//
//  Created by Mahmoud Mohamed Atrees on 07/01/2025.
//

import SwiftUI
import SDWebImageSwiftUI

struct SearchItemsUI: View {
    
    @State var imageUrl: String = "https://picsum.photos/150"
    @State var foodName: String = "Creamy Pasta"
    @State var cooker: [Credit]?
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(height: 121)
                .foregroundStyle(Color.white)
                .shadow(radius: 5)
            
            HStack {
                WebImage(url: URL(string: imageUrl))
                    .resizable()
                    .frame(width: 120, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        LinearGradient(colors: [.black,.white.opacity(0)], startPoint: .bottom, endPoint: .center)
                            .frame(width: 120, height: 120)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                    }
                
                VStack(alignment: .leading,spacing: 5){
                    Text(foodName)
                        .foregroundStyle(.black)
                    
                    if let cookerName = cooker?.first?.name {
                        Text("By \(cookerName)")
                            .font(.footnote)
                            .foregroundStyle(.gray)
                    }else {
                        Text("By Charles Johnson")
                            .font(.footnote)
                            .foregroundStyle(.gray)
                    }
                }
                .bold()
                
                Spacer()
                
            }
        }
        .padding()
    }
}

#Preview {
    SearchItemsUI()
}
