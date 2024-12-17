//
//  DetailsScreen.swift
//  Recipe App
//
//  Created by Mahmoud Mohamed Atrees on 17/12/2024.
//

import SwiftUI

struct DetailsScreen: View {
    
    @State var bookmarkImageFill: String? = "bookmark.fill"
    @State var bookmarkImageUnfill: String? = "bookmark"
    @State var bookmarkColor:Color? = Color.yellow
        
    var body: some View {
        VStack {
            ZStack{
                Image("creamyPasta")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: 200)
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
                    
                    CustomAddButton(imageFill: $bookmarkImageFill,
                                    imageUnfill: $bookmarkImageUnfill,
                                    color: $bookmarkColor) { isToggled in
                        if isToggled {
                            print("recipe saved in the data base")
                        } else {
                            print("recipe removed from the data base")
                        }
                    }
                }
            }
            Spacer()
        }
    }
}

#Preview {
    DetailsScreen()
}
