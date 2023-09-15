//
//  HeroCell.swift
//  Dota2MVVM
//
//  Created by Andres Calizaya on 15/09/2023.
//

import SwiftUI

struct HeroCell: View {
    let hero: Hero // Asegúrate de definir la propiedad `hero` que contendrá los datos de tu héroe

    var body: some View {
        // Aquí construye la apariencia de tu celda
        HStack {
            Image(systemName: "person.fill")
                .resizable()
                .frame(width: 50, height: 50)
            Text(hero.localizedName)
            // Agrega más detalles o elementos según sea necesario
        }
        .padding()
    }
}

struct HeroCell_Previews: PreviewProvider {
    static var previews: some View {
        HeroCell(hero: Hero(dto: HeroDTO(
            id: 1,
            name: "Antimage",
            localizedName: "Anti-Mage",
            primaryAttr: "agi",
            attackType: "Melee",
            roles: ["Carry", "Escape", "Nuker"],
            img: "https://example.com/antimage.jpg",
            icon: "https://example.com/antimage_icon.jpg"
        )))
    }
}
