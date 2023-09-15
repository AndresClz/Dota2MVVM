//
//  Dota2MVVMApp.swift
//  Dota2MVVM
//
//  Created by Andres Calizaya on 14/09/2023.
//

import SwiftUI

@main
struct Dota2MVVMApp: App {
    
    let homeViewModel = HomeViewModel.createWithDefaultDependencies()
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: homeViewModel)
        }
    }
}
