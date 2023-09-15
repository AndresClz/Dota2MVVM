//
//  HeroService.swift
//  Dota2MVVM
//
//  Created by Andres Calizaya on 15/09/2023.
//

import Foundation

class HeroService: HeroServiceProtocol {
    private let heroRepository: HeroRepositoryProtocol

    init(heroRepository: HeroRepositoryProtocol) {
        self.heroRepository = heroRepository
    }

    // Método para obtener héroes y realizar la transformación
    func getHeroes(completion: @escaping (Result<[Hero], HTTPClientError>) -> Void) {
        heroRepository.fetchHeroes { result in
            switch result {
            case .success(let heroDTOs):
                // Realiza la transformación de DTO a modelo de dominio
                let heroes = heroDTOs.map { dto in
                    return Hero(dto: dto)
                }
                completion(.success(heroes))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
