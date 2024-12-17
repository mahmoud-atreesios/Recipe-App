//
//  CustomLoadingIndicator.swift
//  Recipe App
//
//  Created by Mahmoud Mohamed Atrees on 16/12/2024.
//

import SwiftUI

struct CustomLoadingIndicator: View {
    
    let timer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    
    @State var count = 1
    
    var body: some View {
        
        HStack{
            Circle()
                .frame(width: count == 1 ? 20 : 10,height: 50)
            Circle()
                .frame(width: count == 2 ? 20 : 10,height: 50)
            
            Circle()
                .frame(width: count == 3 ? 20 : 10,height: 50)
        }
        .foregroundStyle(.gray)
        .onReceive(timer) { value in
            
            withAnimation(.default){
                count = count == 3 ? 0 : count + 1
            }
        }
        
    }
}

#Preview {
    CustomLoadingIndicator()
}
