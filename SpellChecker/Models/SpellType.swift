//
//  SpellType.swift
//  SpellChecker
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
            return "🦉  TRANSFIGURATION"
        case .charm:
            return "✨  CHARM"
        case .jinx:
            return "🌀  JINX"
        case .hex:
            return "💥  HEX"
        case .curse:
            return "💀  CURSE"
        case .counterSpell:
            return "🛡  COUNTER-SPELL"
        case .healingSpell:
            return "👩🏽‍⚕️  TRANSFIGURATION"
        }
    }
}
