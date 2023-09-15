//
//  HomeView.swift
//  Dota2MVVM
//
//  Created by Andres Calizaya on 15/09/2023.
//

import SwiftUI

struct HomeView: View {
    // ViewModel para gestionar los estados
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        
        VStack {
            switch viewModel.state {
            case .loading:
                ProgressView("Cargando...")
            case .connectionError:
                Text("Error de conexión. Por favor, verifica tu conexión a Internet.")
            case .failure(let error):
                Text("Error: \(error.localizedDescription)")
            case .empty:
                Text("No se han encontrado resultados")
            case .success(let heroes):
                List(heroes, id: \.id) { hero in
                    VStack{
                        Text(hero.localizedName)
//                        if let urlString = hero.imageURL?.absoluteString {d
//                            Text(urlString)
//                        }
                    }
                    // Agrega más detalles del héroe según sea necesario
                }
            }
        }
        .onAppear {
            // Cuando aparece la vista, carga los datos
            viewModel.loadData()
        }
        .refreshable {
            viewModel.loadData()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let homeViewModel = HomeViewModel.createWithDefaultDependencies()
        HomeView(viewModel: homeViewModel)
    }
}
