//
//  SpellType.swift
//  Queerlist
//
//  Created by Rafael Schmitt on 03/05/20.
//  Copyright © 2020 Rafael Claycon Schmitt. All rights reserved.
//

import Foundation

enum SpellType: String {                         // PT-BR               // FR-CA
    case transfiguration = "🦉  Transfiguration" // Transfiguração      // Métamorphose
    case charm = "✨  Charm"                     // Encantamento        // Enchantement ou charme
    case jinx = "🌀  Jinx"                       // Azaração            //
    case hex = "💥  Hex"                         // Feitiço             // Maléfice
    case curse = "💀  Curse"                     // Maldição            // Malédiction
    case counterSpell = "🛡  Counter-spell"      // Contra-azaração     //
    case healingSpell = "👩🏽‍⚕️  Healing spell"      // Feitiço de cura     //
    
    static func getTypeNameForTinyHeader(_ type: SpellType) -> String {
        switch type {
        case .transfiguration:
            return self.transfiguration.rawValue.uppercased()
        case .charm:
            return self.charm.rawValue.uppercased()
        case .jinx:
            return self.jinx.rawValue.uppercased()
        case .hex:
            return self.hex.rawValue.uppercased()
        case .curse:
            return self.curse.rawValue.uppercased()
        case .counterSpell:
            return self.counterSpell.rawValue.uppercased()
        case .healingSpell:
            return self.healingSpell.rawValue.uppercased()
        }
    }
}
