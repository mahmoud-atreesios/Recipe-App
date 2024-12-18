//
//  DetailsSheet.swift
//  Recipe App
//
//  Created by Mahmoud Mohamed Atrees on 18/12/2024.
//

import SwiftUI

struct DetailsSheet: View {
    var body: some View {
        
        VStack(alignment: .leading){
            
            headerTitle()
            headerDetails()
            recipeDescription()
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.top, 20)
    }
}

//MARK: - HEADER TITLE
extension DetailsSheet{
    private func headerTitle() -> some View {
        Text("Shrimp Scampi Pasta")
            .font(.title)
            .bold()
            .fontDesign(.monospaced)
    }
}

//MARK: - THE THREE CIRCLE DETAILS (TIME,CALORIES,RATING)
extension DetailsSheet{
    private func headerDetails() -> some View {
        HStack {
            HStack(spacing: 3) {
                Image(systemName: "clock.fill")
                Text("30min")
                    .font(.caption)
            }
            .bold()
            .foregroundColor(.detailsButtonsColor)
            .padding(.all, 10)
            .background(
                RoundedRectangle(cornerRadius: 60)
                    .foregroundStyle(Color.mainAppBackground)
                    .shadow(radius: 5)
            )
            HStack(spacing: 3) {
                Image(systemName: "flame.fill")
                Text("370 kcl")
                    .font(.caption)
            }
            .bold()
            .foregroundColor(.detailsButtonsColor)
            .padding(.all, 10)
            .background(
                RoundedRectangle(cornerRadius: 60)
                    .foregroundStyle(Color.mainAppBackground)
                    .shadow(radius: 5)
            )
            HStack(spacing: 3) {
                Image(systemName: "star.fill")
                Text("4.8")
                    .font(.caption)
            }
            .bold()
            .foregroundColor(.detailsButtonsColor)
            .padding(.all, 10)
            .background(
                RoundedRectangle(cornerRadius: 60)
                    .foregroundStyle(Color.mainAppBackground)
                    .shadow(radius: 5)
            )
        }
    }
}

//MARK: - RECIPE DESCRIPTION
extension DetailsSheet {
    private func recipeDescription() -> some View {
        Text("Food, substance consisting essentially of protein, carbohydrate, fat, and other nutrients used in the body of an organism to sustain growth and vital processes and to furnish energy. The absorption and utilization of food by the body is fundamental to nutrition and is facilitated by digestion.")
            .font(.callout)
            .fontDesign(.serif)
            .foregroundStyle(.secondary)
            .padding(.top, 10)
    }
}

#Preview {
    DetailsSheet()
}

