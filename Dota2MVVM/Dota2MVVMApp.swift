//
//  Dota2MVVMApp.swift
//  Dota2MVVM
//
//  Created by Andres Calizaya on 14/09/2023.
//

import SwiftUI

@main
struct Dota2MVVMApp: App {
    
    let heroService: HeroServiceProtocol = HeroService(heroRepository: HeroRepository(httpClient: HTTPClient.shared))

    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: HomeViewModel(heroService: heroService))
        }
    }
}
