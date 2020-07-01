//
//  MockData.swift
//  SpellChecker
//
//  Created by Rafael Schmitt on 02/05/20.
//  Copyright © 2020 Rafael Claycon Schmitt. All rights reserved.
//

import UIKit

class MockData {
    static func insertSpells(into spellStore: SpellStore) {
        var data = [Spell]()
        
        // A
        data.append(Spell(name: "Accio", nickname: "Summoning Charm", type: .charm, pronunciation: "AH-kee-oh", description: "Summons an object towards the caster.", image: UIImage(named: "Accio")!, date: Date()))
        data.append(Spell(name: "Aguamenti", nickname: "Water-Making Spell", type: .charm, pronunciation: "AH-gwah-MEN-tee", description: "Produces a clean, drinkable jet of water from the wand tip.", image: UIImage(named: "Aguamenti"), date: Date()))
        data.append(Spell(name: "Alohomora", nickname: "Unlocking Charm", type: .charm, pronunciation: "ah-LOH-ho-MOR-ah", description: "Unlocks doors and other objects.", image: nil, date: Date()))
        data.append(Spell(name: "Anapneo", nickname: nil, type: .healingSpell, pronunciation: "ah-NAP-nee-oh", description: "Clears the target's airway if they are choking on something.", image: nil, date: Date()))
        data.append(Spell(name: "Aparecium", nickname: "Revealing Charm", type: .charm, pronunciation: "AH-par-EE-see-um", description: "Reveals secret messages written in invisible ink, or any other hidden markings. Also works against Concealing charms.", image: nil, date: Date()))
        data.append(Spell(name: "Arania Exumai", nickname: "Spider repelling spell", type: .charm, pronunciation: "ah-RAHN-ee-a EKS-su-may", description: "Drives away spiders, including Acromantulas.", image: nil, date: Date()))
        data.append(Spell(name: "Aresto Momentum", nickname: "Slowing Charm", type: .charm, pronunciation: "ah-REST-oh mo-MEN-tum", description: "Decreases the velocity of a moving target.", image: nil, date: Date()))
        data.append(Spell(name: "Avifors", nickname: nil, type: .transfiguration, pronunciation: "AH-vi-fors", description: "Transforms the target into a bird.", image: nil, date: Date()))
        
        // B
        data.append(Spell(name: "Bombarda", nickname: "Exploding Charm", type: .charm, pronunciation: "bom-BAR-dah", description: "Provokes a small explosion.", image: nil, date: Date()))
        
        // C
        data.append(Spell(name: "Calvorio", nickname: "Hair-Loss Curse", type: .curse, pronunciation: "cal-VOR-ee-oh", description: "Removes the victim's hair.", image: nil, date: Date()))
        data.append(Spell(name: "Cantis", nickname: nil, type: .jinx, pronunciation: "CAN-tiss", description: "Causes the victim to burst uncontrollably into song.", image: nil, date: Date()))
        data.append(Spell(name: "Colovaria", nickname: "Colour Change Charm", type: .charm, pronunciation: "co-loh-VA-riah", description: "Changes the target's colour.", image: nil, date: Date()))
        data.append(Spell(name: "Confringo", nickname: "Blasting Curse", type: .curse, pronunciation: "kon-FRING-goh", description: "Produces a fiery explosion.", image: nil, date: Date()))
        data.append(Spell(name: "Confundo", nickname: "Confundus Charm", type: .charm, pronunciation: "con-FUN-doh", description: "Causes the victim to become confused and befuddled.", image: nil, date: Date()))
        data.append(Spell(name: "Crucio", nickname: "KROO-see-oh", type: .curse, pronunciation: "Cruciatus Curse", description: "Inflicts intense pain on the recipient of the curse. This curse does not physically harm the victim, but may in extreme cases drive them insane. The pain is described as having hot knives being driven into the victim. It cannot be cast successfully by a person who is doing so out of pure spite or anger; one must feel a true desire to cause the victim pain. If one casts this spell, he or she will receive a life sentence in Azkaban prison for it, as with the other two Unforgivable Curses.", image: nil, date: Date()))
        
        // D
        data.append(Spell(name: "Deprimo", nickname: nil, type: .charm, pronunciation: "deh-PREEM-oh", description: "Charm used to blast holes in the ground.", image: nil, date: Date()))
        data.append(Spell(name: "Depulso", nickname: "Banishing Charm", type: .charm, pronunciation: "deh-PUL-soh", description: "Sends the target away from the caster. It is the counter-charm to the Summoning Charm.", image: nil, date: Date()))
        data.append(Spell(name: "Descendo", nickname: nil, type: .charm, pronunciation: "deh-SEN-doh", description: "Causes object to fall or move downwards.", image: nil, date: Date()))
        data.append(Spell(name: "Diffindo", nickname: "Severing Charm", type: .charm, pronunciation: "dih-FIN-doh", description: "Used to precisely cut or tear objects.", image: nil, date: Date()))
        data.append(Spell(name: "Duro", nickname: "Hardening Charm", type: .charm, pronunciation: "DYOO-roh", description: "Turns an object to stone.", image: nil, date: Date()))
        
        // E
        data.append(Spell(name: "Engorgio", nickname: "Engorgement Charm", type: .charm, pronunciation: "en-GOR-jee-oh", description: "Causes the target to swell in physical size. Its counter-charm is the Shrinking Charm.", image: nil, date: Date()))
        data.append(Spell(name: "Episkey", nickname: nil, type: .healingSpell, pronunciation: "ee-PIS-key", description: "Used to heal relatively minor injuries, such as broken bones and cartilage.", image: nil, date: Date()))
        
        // Build letter array
        
        spellStore.letters = data.map({ (spell) -> String in
            return String(spell.name.prefix(1))
        })
        
        spellStore.letters = spellStore.letters.sorted()
        
        spellStore.letters = spellStore.letters.reduce([], { (list, name) -> [String] in
            if !list.contains(name) {
                return list + [name]
            }
            return list
        })
        
        // Build spell array
        
        for entry in data {
            let firstLetter = String(entry.name.prefix(1))
            
            if spellStore.spells[firstLetter] == nil {
                spellStore.spells[firstLetter] = [Spell]()
            }
            
            spellStore.spells[firstLetter]!.append(entry)
        }
        
        for (letter, list) in spellStore.spells {
            spellStore.spells[letter] = list.sorted { $0.name < $1.name }
        }
    }
}
