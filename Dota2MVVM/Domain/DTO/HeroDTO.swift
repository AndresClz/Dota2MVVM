//
//  HeroDTO.swift
//  Dota2MVVM
//
//  Created by Andres Calizaya on 14/09/2023.
//

import Foundation

// MARK: - Hero
struct HeroDTO: Codable {
    let id: Int
    let name, localizedName, primaryAttr, attackType: String
    let roles: [String]
    let img, icon: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case localizedName = "localized_name"
        case primaryAttr = "primary_attr"
        case attackType = "attack_type"
        case roles, img, icon
    }
}
