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
                    Text(hero.localizedName)
                    // Agrega más detalles del héroe según sea necesario
                }
            }
        }
        .onAppear {
            // Cuando aparece la vista, carga los datos
            viewModel.loadData()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel(
            heroService: HeroService(
                heroRepository: HeroRepository(
                    httpClient: HTTPClient.shared))))
    }
}
