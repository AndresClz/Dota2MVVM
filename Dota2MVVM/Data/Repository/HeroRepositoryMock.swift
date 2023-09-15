//
//  HeroRepositoryMock.swift
//  Dota2MVVM
//
//  Created by Andres Calizaya on 15/09/2023.
//

import Foundation

class HeroRepositoryMock: HeroRepositoryProtocol {
    func fetchHeroes(completion: @escaping (Result<[HeroDTO], HTTPClientError>) -> Void) {
        // Simular una respuesta exitosa con datos de prueba (mock)
        let heroDTO1 = HeroDTO(
            id: 1,
            name: "Antimage",
            localizedName: "Anti-Mage",
            primaryAttr: "agi",
            attackType: "Melee",
            roles: ["Carry", "Escape", "Nuker"],
            img: "https://example.com/antimage.jpg",
            icon: "https://example.com/antimage_icon.jpg"
        )

        let heroDTO2 = HeroDTO(
            id: 2,
            name: "Crystal Maiden",
            localizedName: "Crystal Maiden",
            primaryAttr: "int",
            attackType: "Ranged",
            roles: ["Support", "Disabler", "Nuker"],
            img: "https://example.com/crystalmaiden.jpg",
            icon: "https://example.com/crystalmaiden_icon.jpg"
        )

        let heroDTO3 = HeroDTO(
            id: 3,
            name: "Earthshaker",
            localizedName: "Earthshaker",
            primaryAttr: "str",
            attackType: "Melee",
            roles: ["Support", "Initiator", "Disabler"],
            img: "https://example.com/earthshaker.jpg",
            icon: "https://example.com/earthshaker_icon.jpg"
        )

        let heroDTOArray: [HeroDTO] = [heroDTO1, heroDTO2, heroDTO3]
        completion(.success(heroDTOArray))
    }
}
