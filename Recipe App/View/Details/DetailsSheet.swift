//
//  DetailsSheet.swift
//  Recipe App
//
//  Created by Mahmoud Mohamed Atrees on 18/12/2024.
//

import SwiftUI

struct DetailsSheet: View {
    
    var recipe: Result
    @State var count = 0
    
    var body: some View {
        ZStack {
            
            Color.white.ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading){
                    headerTitle()
                    headerDetails()
                    recipeDescription()
                    recipeInstruction()
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 40))
        .padding(.top, UIScreen.main.bounds.height * 0.30)
        .ignoresSafeArea()
    }
}

//MARK: - HEADER TITLE
extension DetailsSheet{
    private func headerTitle() -> some View {
        Text(recipe.name)
            .font(.title)
            .bold()
            .fontDesign(.monospaced)
    }
}

//MARK: - THE THREE CIRCLE DETAILS (TIME,CALORIES,RATING)
extension DetailsSheet{
    private func headerDetails() -> some View {
        HStack {
            //Cooking Time
            HStack(spacing: 3) {
                Image(systemName: "clock.fill")
                if let recipeTime = recipe.totalTimeTier?.displayTier{
                    switch recipeTime {
                    case .under15Minutes:
                        Text("15 min")
                            .font(.caption)
                    case .under30Minutes:
                        Text("30 min")
                            .font(.caption)
                    case .under45Minutes:
                        Text("45 min")
                            .font(.caption)
                    }
                }else {
                    Text("30 min")
                        .font(.caption)
                }
            }
            .bold()
            .foregroundColor(.detailsButtonsColor)
            .padding(.all, 10)
            .background(
                RoundedRectangle(cornerRadius: 60)
                    .foregroundStyle(Color.mainAppBackground)
                    .shadow(radius: 5)
            )
            
            //Calories Count
            HStack(spacing: 3) {
                Image(systemName: "flame.fill")
                Text("\(recipe.nutrition.calories ?? 300) kcl")
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
            
            //Users Rating
            HStack(spacing: 3) {
                Image(systemName: "star.fill")
                Text(String(format: "%.1f", (recipe.userRatings.score * 10) / 2))
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
        Text(recipe.description ?? "foodDescription")
            .font(.callout)
            .fontDesign(.serif)
            .foregroundStyle(.secondary)
            .padding(.top, 10)
    }
}

//MARK: - RECIPE INSTRUCTION
extension DetailsSheet {
    private func recipeInstruction() -> some View {
        VStack(alignment: .leading, spacing: 10) {
            
            Text("Instructions:")
                .font(.title2)
                .bold()
            
            if let instructions = recipe.instructions {
                ForEach(Array(instructions.enumerated()), id: \.element.displayText) { index, instruction in
                    VStack(alignment: .leading, spacing: 0) {
                        if index != instructions.count - 1 {
                            Text("Step \(index + 1)")
                                .font(.headline)
                                .foregroundStyle(Color.seeAllColor)
                        }
                        Text(instruction.displayText)
                            .font(.callout)
                            .fontDesign(.serif)
                            .foregroundStyle(.black)
                    }
                }
            } else {
                Text("No instructions available.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
        }
        .padding()
    }
}

#Preview {
    DetailsSheet(recipe: Result.mock)
}

