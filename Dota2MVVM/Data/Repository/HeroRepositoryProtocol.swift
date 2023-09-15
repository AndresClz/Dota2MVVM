//
//  HeroRepositoryProtocol.swift
//  Dota2MVVM
//
//  Created by Andres Calizaya on 14/09/2023.
//

import Foundation

protocol HeroRepositoryProtocol {
    func getHeroes(completion: @escaping (Result<[Hero], Error>) -> Void)
}
