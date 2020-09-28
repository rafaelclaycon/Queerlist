//
//  SpellType.swift
//  SpellChecker
//
//  Created by Rafael Schmitt on 03/05/20.
//  Copyright © 2020 Rafael Claycon Schmitt. All rights reserved.
//

import Foundation

enum SpellType: Int, Decodable {
    case transfiguration
    case charm
    case jinx
    case hex
    case curse
    case counterSpell
    case healingSpell
    
    static func getTypeName(_ type: SpellType) -> String? {
        switch type.rawValue {
        case 0:                          // PT-BR               // FR-CA
            return "🦉  Transfiguration" // Transfiguração      // Métamorphose
        case 1:
            return "✨  Charm"           // Encantamento        // Enchantement ou charme
        case 2:
            return "🌀  Jinx"            // Azaração            //
        case 3:
            return "💥  Hex"             // Feitiço             // Maléfice
        case 4:
            return "💀  Curse"           // Maldição            // Malédiction
        case 5:
            return "🛡  Counter-spell"   // Contra-azaração     //
        case 6:
            return "👩🏽‍⚕️  Healing spell"   // Feitiço de cura     //
        default:
            return nil
        }
    }
}
