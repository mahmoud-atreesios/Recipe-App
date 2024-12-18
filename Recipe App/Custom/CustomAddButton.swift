//
//  CustomAddButton.swift
//  Recipe App
//
//  Created by Mahmoud Mohamed Atrees on 17/12/2024.
//

import SwiftUI

struct CustomAddButton: View {
    
    var imageFill: String?
    var imageUnfill: String?
    var color: Color?
    
    @State var toggle = false
    var onButtonPressed: ((Bool) -> Void)?
    
    var body: some View {
        VStack {
            Button {
                toggle.toggle()
                onButtonPressed?(toggle)
            } label: {
                imageButtonView
            }
        }
    }
    
    var imageButtonView: some View{
        Circle()
            .fill(.white)
            .frame(width: 40, height: 40)
            .shadow(radius: 10)
            .overlay {
                Image(systemName: toggle ? imageFill ?? "" : imageUnfill ?? "")
                    .foregroundColor(color ?? .blue)
                    .font(.title3)
            }
    }
    
}

struct AddButtonsBootCamp_Previews: PreviewProvider {
    @State static var imageFill: String? = "heart.fill"
    @State static var imageUnfill: String? = "heart"
    @State static var color:Color? = Color.red
    
    static var previews: some View {
        CustomAddButton(imageFill: imageFill, imageUnfill: imageUnfill, color: color)
    }
}

