//
//  DetailsScreen.swift
//  Recipe App
//
//  Created by Mahmoud Mohamed Atrees on 17/12/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailsScreen: View {
    
    var recipe: Result
        
    var body: some View {
        ZStack {
            VStack {
                imageAndToolBar()
                Spacer()
            }
            .edgesIgnoringSafeArea(.all)
            
            DetailsSheet(recipe: recipe)
                    .clipShape(RoundedRectangle(cornerRadius: 40))
                    .offset(y: UIScreen.main.bounds.height * 0.30)
        }
    }
}

//MARK: - Header, Image and tool bar
extension DetailsScreen{
    private func imageAndToolBar() -> some View{
        ZStack{
            
            if let imageUrl = recipe.thumbnailURL{
                WebImage(url: URL(string: imageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: 500)
                    .clipShape(Rectangle())
            }else{
                ProgressView()
            }
            
            VStack {
                HStack {
                    Button {
                        print("back button pressed")
                    } label: {
                        Image(systemName: "arrow.turn.up.left")
                            .frame(width: 40, height: 40)
                            .background(.white)
                            .clipShape(.circle)
                            .foregroundStyle(.black)
                            .font(.system(size: 20))
                    }
                    Spacer()
                    CustomAddButton(imageFill: Constant.bookmarkButtonImageFill,
                                    imageUnfill: Constant.bookmarkButtonImageUnfill,
                                    color: Color.yellow) { isToggled in
                        if isToggled {
                            print("recipe saved in the data base")
                        } else {
                            print("recipe removed from the data base")
                        }
                    }
                }
                .padding(.horizontal, 15)
                .padding(.top, 50)
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width, height: 500)
        }
    }
}

#Preview {
    DetailsScreen(recipe: Result.mock)
}
