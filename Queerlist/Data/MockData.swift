//
//  MockData.swift
//  Queerlist
//
//  Created by Rafael Schmitt on 02/05/20.
//  Copyright © 2020 Rafael Claycon Schmitt. All rights reserved.
//

import UIKit

class MockData {
    static func insertSpells(into spellStore: PersonalityStore) {
        spellStore.allItems.append(Personality(name: "Alan Turing", nickname: "Summoning Charm", type: .charm, pronunciation: "AH-kee-oh", description: "Summons an object towards the caster.", image: UIImage(named: "Accio")!, date: Date()))
        spellStore.allItems.append(Personality(name: "Cássia Eller", nickname: "Water-Making Spell", type: .charm, pronunciation: "AH-gwah-MEN-tee", description: "Produces a clean, drinkable jet of water from the wand tip.", image: UIImage(named: "Aguamenti"), date: Date()))
        spellStore.allItems.append(Personality(name: "Laerte", nickname: "Unlocking Charm", type: .charm, pronunciation: "ah-LOH-ho-MOR-ah", description: "Unlocks doors and other objects.", image: nil, date: Date()))
        spellStore.allItems.append(Personality(name: "Ludmilla", nickname: nil, type: .healingSpell, pronunciation: "ah-NAP-nee-oh", description: "Clears the target's airway if they are choking on something.", image: nil, date: Date()))
        spellStore.allItems.append(Personality(name: "Marsha P. Johnson", nickname: "Revealing Charm", type: .charm, pronunciation: "AH-par-EE-see-um", description: "Reveals secret messages written in invisible ink, or any other hidden markings. Also works against Concealing charms.", image: nil, date: Date()))
        spellStore.allItems.append(Personality(name: "Marta", nickname: "Spider repelling spell", type: .charm, pronunciation: "ah-RAHN-ee-a EKS-su-may", description: "Drives away spiders, including Acromantulas.", image: nil, date: Date()))
        spellStore.allItems.append(Personality(name: "Miss Biá", nickname: "Slowing Charm", type: .charm, pronunciation: "ah-REST-oh mo-MEN-tum", description: "Decreases the velocity of a moving target.", image: nil, date: Date()))
        spellStore.allItems.append(Personality(name: "Pabllo Vittar", nickname: nil, type: .transfiguration, pronunciation: "AH-vi-fors", description: "Transforms the target into a bird.", image: nil, date: Date()))
        spellStore.allItems.append(Personality(name: "Paulo Iotti", nickname: nil, type: .transfiguration, pronunciation: "AH-vi-fors", description: "Transforms the target into a bird.", image: nil, date: Date()))
        spellStore.allItems.append(Personality(name: "RuPaul", nickname: nil, type: .transfiguration, pronunciation: "AH-vi-fors", description: "Transforms the target into a bird.", image: nil, date: Date()))
        spellStore.allItems.append(Personality(name: "Thammy Miranda", nickname: nil, type: .transfiguration, pronunciation: "AH-vi-fors", description: "Transforms the target into a bird.", image: nil, date: Date()))
    }
}
