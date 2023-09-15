//
//  HeroModel.swift
//  Dota2MVVM
//
//  Created by Andres Calizaya on 14/09/2023.
//

import Foundation

struct Hero {
    let id: Int
    let name: String
    let localizedName: String
    let primaryAttribute: String
    let attackType: String
    let roles: [String]
    let imageURL: URL?
    let iconURL: URL?
    
    // Inicializador para mapear desde el DTO al modelo
    init(dto: HeroDTO) {
        self.id = dto.id
        self.name = dto.name
        self.localizedName = dto.localizedName
        self.primaryAttribute = dto.primaryAttr
        self.attackType = dto.attackType
        self.roles = dto.roles
        
        // Parseo seguro de las URLs
        self.imageURL = URL(string: dto.img)
        self.iconURL = URL(string: dto.icon)
    }
}
typealias Heroes = [Hero]
