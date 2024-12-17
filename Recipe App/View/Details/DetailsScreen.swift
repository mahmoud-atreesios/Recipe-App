//
//  DetailsScreen.swift
//  Recipe App
//
//  Created by Mahmoud Mohamed Atrees on 17/12/2024.
//

import SwiftUI

struct DetailsScreen: View {
    
    @State var text: String = ""
    
    var body: some View {
        Text("\(text)")
    }
}

#Preview {
    DetailsScreen()
}
