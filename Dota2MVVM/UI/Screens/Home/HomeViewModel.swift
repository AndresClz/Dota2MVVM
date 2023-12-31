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
    private let heroService: HeroService
    
    init(heroService: HeroService) {
        self.heroService = heroService
    }
    
    func loadData() {
        state = .loading
        heroService.getHeroes { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let heroes):
                    if heroes.count == 0 {
                        self.state = .empty
                    }
                    self.state = .success(array: heroes)
                case .failure(let error):
                    switch error {
                    case .noInternetConnection:
                        self.state = .connectionError
                    case .invalidResponse, .invalidURL:
                        self.state = .failure(error)
                    case .networkError(_):
                        self.state = .failure(error)
                    }
                }
            }
        }
    }
    
    static func createWithDefaultDependencies() -> HomeViewModel {
            let httpClient = HTTPClient.shared
            let heroStrategy = HeroDataOnlineStrategy(httpClient: httpClient)
            let heroService = HeroService(heroStrategy: heroStrategy)
            return HomeViewModel(heroService: heroService)
    }
    
    static func createWithMockedDependencies() -> HomeViewModel {
            let heroStrategy = HeroDataMockStrategy()
            let heroService = HeroService(heroStrategy: heroStrategy)
            return HomeViewModel(heroService: heroService)
    }
}
