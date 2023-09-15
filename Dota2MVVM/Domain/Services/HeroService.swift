//
//  HeroService.swift
//  Dota2MVVM
//
//  Created by Andres Calizaya on 15/09/2023.
//

import Foundation

struct HeroService {
    private let heroStrategy: HeroDataStrategy

    init(heroStrategy: HeroDataStrategy) {
        self.heroStrategy = heroStrategy
    }

    // Método para obtener héroes y realizar la transformación
    func getHeroes(completion: @escaping (Result<[Hero], HTTPClientError>) -> Void) {
        heroStrategy.fetchHeroes { result in
            switch result {
            case .success(let heroDTOs):
                // Realiza la transformación de DTO a modelo de dominio
//                let heroes = heroDTOs.map { dto in Hero(dto: dto) }
                let heroes = heroDTOs.map({Hero(dto: $0)})

                completion(.success(heroes))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
