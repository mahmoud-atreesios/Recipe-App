//
//  HomeScreen.swift
//  Recipe App
//
//  Created by Mahmoud Mohamed Atrees on 14/12/2024.
//

import SwiftUI

struct HomeScreen: View {
    
    @AppStorage("rootHomeScreen") var rootHomeScreen: Bool?
    @StateObject var networkViewModel = NetworkViewModel()
    @Namespace var animationNamespace
    @Binding var showTabBar: Bool
    @FocusState var isSearchFieldFocused: Bool

    @State var searchQuery: String = ""
    @State var showDetailsScreen: Bool = false
    @State var showDetailsScreenFromRecipeOfTheWeek: Bool = false
    @State var selectedRecipe: Result?
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Color.mainAppBackground.ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading) {
                        headerView()
                        searchBar()
                        categoryBar(title: "Recommendation")
                        recommendationView()
                        categoryBar(title: "Recipes Of The Week")
                        recipeOfTheWeekView()
                        additionalSpace()
                        Spacer()
                    }
                }
                .onTapGesture {
                    UIApplication.shared.endEditing()
                }
                
                VStack{
                    Spacer()
                    overlayView()
                }
                
            }
            .overlay(
                showDetailsScreenHeroAnimation()
            )
            .onChange(of: isSearchFieldFocused) { focused in
                showTabBar = false
            }
        }
    }
}

//MARK: - Header UI
extension HomeScreen {
    private func headerView() -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Hello, Mahmoud")
                    .fontDesign(.monospaced)
                    .foregroundStyle(.gray)
                Text("What would you like to cook today?")
                    .frame(width: 220, height: 60)
                    .font(.title2)
                    .bold()
            }
            .padding(.leading, 30)
            .padding(.bottom, 20)
            Spacer()
            Image("profileImage")
                .resizable()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .padding(.trailing, 25)
        }
        .opacity(searchQuery.isEmpty ? 1 : 0)
    }
}

//MARK: - Search Bar UI
extension HomeScreen {
    private func searchBar() -> some View {
        ZStack {
            TextField("Search any recipes", text: $searchQuery)
                .padding(.leading, 15)
                .frame(width: 330, height: 50)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 10)
                .focused($isSearchFieldFocused)
                .offset(y: isSearchFieldFocused ? -100 : 0)
                .animation(.easeInOut, value: isSearchFieldFocused)
            
            HStack {
                Spacer()
                Button {
                    print("Search button image pressed")
                } label: {
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .foregroundStyle(.gray)
                        .bold()
                }
                .padding(.trailing, 50)
            }
            .offset(y: isSearchFieldFocused ? -100 : 0)
            .animation(.easeInOut, value: isSearchFieldFocused)
            
        }
    }
}

//MARK: - Recommendation bar
extension HomeScreen {
    private func categoryBar(title: String) -> some View {
        HStack {
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
            Spacer()
            Text("See all")
                .font(.caption)
                .foregroundStyle(Color.seeAllColor)
        }
        .padding(.horizontal, 15)
        .padding(.top, 25)
    }
}

//MARK: - Recomendation View
extension HomeScreen {
    private func recommendationView() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                if let recipes = networkViewModel.recipes?.results {
                    
                    ForEach(recipes.prefix(7)) { recipe in
                        
                        if recipe == recipes[2]{
                            RecommendationUI(imageUrl: nil, foodName: recipe.name, cooker: recipe.credits, animationNamespace: animationNamespace)
                                .onTapGesture {
                                    showDetailsScreen.toggle()
                                    selectedRecipe = recipe
                                }
                        }else {
                            RecommendationUI(imageUrl: recipe.thumbnailURL ?? "", foodName: recipe.name, cooker: recipe.credits,animationNamespace: animationNamespace)
                                .onTapGesture {
                                    selectedRecipe = recipe
                                    withAnimation(.easeInOut(duration: 0.3)) {
                                        showDetailsScreen.toggle()
                                    }
                                }
                                .matchedGeometryEffect(id: "recipeImage-\(recipe.id)", in: animationNamespace)
                        }
                    }
                } else {
                    customIndicator()
                        .offset(x: UIScreen.main.bounds.width / 2 - 55, y: 0)
                }
            }
            .padding(.leading, 15)
        }
    }
}

//MARK: - Showing details screen with hero animation
extension HomeScreen {
    private func showDetailsScreenHeroAnimation() -> some View {
        Group {
            if showDetailsScreen, let selectedRecipe = selectedRecipe {
                DetailsScreen(recipe: selectedRecipe, animationNamespace: animationNamespace, showDetailsScreen: $showDetailsScreen)
                    .onAppear {
                        showTabBar = false
                    }
                    .onDisappear {
                        showTabBar = true
                    }
            }
        }
            .onChange(of: showDetailsScreen) { newValue in
                if !newValue {
                    showTabBar = true
                }
            }
    }
}

//MARK: - RecipeOfTheWeekView
extension HomeScreen {
    private func recipeOfTheWeekView() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                if let recipes = networkViewModel.recipes?.results {
                    ForEach(recipes.suffix(7)) { recipe in
                        NavigationLink(destination: DetailsScreen(recipe: recipe, animationNamespace: animationNamespace, showDetailsScreen: .constant(false))) {
                            RecipeOfTheWeekUI(imageUrl: recipe.thumbnailURL ?? "", foodName: recipe.name, cooker: recipe.credits)
                        }
                    }
                }else{
                    customIndicator()
                        .offset(x: UIScreen.main.bounds.width / 2 - 55, y: 0)
                }
            }
            .padding(.horizontal, 15)
        }
    }
}

// MARK: - Overlay View
extension HomeScreen {
    private func overlayView() -> some View {
            ZStack{
                Color.gray.ignoresSafeArea()
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 200, height: 200)
            }
            .frame(width: UIScreen.main.bounds.width, height: isSearchFieldFocused ? 700 : 0)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            //.opacity(!searchQuery.isEmpty ? 1 : 0)
            .animation(.easeInOut, value: isSearchFieldFocused)
        
    }
}

//MARK: - Custom Indicator setup
extension HomeScreen {
    private func customIndicator() -> some View {
        HStack {
            Rectangle()
                .frame(width: 10, height: 10)
                .foregroundStyle(Color.clear)
            Spacer()
            CustomLoadingIndicator()
                .frame(width: .infinity, height: 250, alignment: .center)
            Spacer()
            Rectangle()
                .frame(width: 10, height: 10)
                .foregroundStyle(Color.clear)
        }
    }
}

//MARK: - Additional Space
extension HomeScreen {
    private func additionalSpace() -> some View {
        Rectangle()
            .frame(width: .infinity, height: 45)
            .foregroundStyle(Color.clear)
    }
}

#Preview {
    HomeScreen(showTabBar: .constant(false))
}

//MARK: - full screen cover for recipe of the week
/*
 .fullScreenCover(isPresented: Binding(
     get: { showDetailsScreenFromRecipeOfTheWeek && selectedRecipe != nil },
     set: { showDetailsScreenFromRecipeOfTheWeek = $0 }
 )) {
     if let selectedRecipe = selectedRecipe {
         DetailsScreen(recipe: selectedRecipe, animationNamespace: animationNamespace, showDetailsScreen: $showDetailsScreenFromRecipeOfTheWeek)
     }
 }
 */
/*
 RecipeOfTheWeekUI(imageUrl: recipe.thumbnailURL ?? "", foodName: recipe.name, cooker: recipe.credits)
     .onTapGesture {
         selectedRecipe = recipe
         showDetailsScreenFromRecipeOfTheWeek.toggle()
     }
 */
