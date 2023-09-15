//
//  HomeViewModel.swift
//  Dota2MVVM
//
//  Created by Andres Calizaya on 15/09/2023.
//

import Foundation

enum ViewState<T> {
    case loading
    case connectionError
    case failure(Error)
    case success(array: T)
    case empty
}

class HomeViewModel: ObservableObject {
    @Published var state: ViewState<[Hero]> = .loading
    private let heroService: HeroServiceProtocol
    
    init(heroService: HeroServiceProtocol) {
        self.heroService = heroService
    }
    
    func loadData() {
        state = .loading
        heroService.getHeroes { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let heroes):
                    if heroes.count == 0 {
                        self?.state = .empty
                    }
                    self?.state = .success(array: heroes)
                case .failure(let error):
                    switch error {
                    case .noInternetConnection:
                        self?.state = .connectionError
                    case .invalidResponse, .invalidURL:
                        self?.state = .failure(error)
                    case .networkError(_):
                        self?.state = .failure(error)
                    }
                }
            }
        }
    }
}
