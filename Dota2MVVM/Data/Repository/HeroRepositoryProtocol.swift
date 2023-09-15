//
//  HeroRepositoryProtocol.swift
//  Dota2MVVM
//
//  Created by Andres Calizaya on 14/09/2023.
//

import Foundation

protocol HeroRepositoryProtocol {
    func fetchHeroes(completion: @escaping (Result<[HeroDTO], HTTPClientError>) -> Void)
}
