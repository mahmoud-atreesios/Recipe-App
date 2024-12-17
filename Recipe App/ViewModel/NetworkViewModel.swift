//
//  NetworkViewModel.swift
//  Recipe App
//
//  Created by Mahmoud Mohamed Atrees on 14/12/2024.
//

import Foundation
import Combine

class NetworkViewModel: ObservableObject{
    
    @Published var recipes: RecipesModel?
    
    private let network = Network()
    private let headers = [
        "x-rapidapi-key": Constant.apiKey,
        "x-rapidapi-host": Constant.host
    ]
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        getRecipes()
    }
    
    //MARK: - GETINNG RECIPES DATA
    func getRecipes(){
        network.getData(url: "https://tasty.p.rapidapi.com/recipes/list?from=0&size=20&tags=under_30_minutes", model: RecipesModel.self, headers: headers)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Request succeeded")
                case .failure(let error):
                    print("Error: \(error)")
                }
            }, receiveValue: { [weak self] returnedRecipes in
                self?.recipes = returnedRecipes
                print("dattatatatatatat \(String(describing: returnedRecipes))")
            })
            .store(in: &cancellables)

    }
}

