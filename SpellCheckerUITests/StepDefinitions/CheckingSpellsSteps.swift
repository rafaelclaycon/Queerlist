//
//  CheckingSpellsSteps.swift
//  SpellCheckerUITests
//
//  Created by Rafael Schmitt on 21/10/19.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import Foundation
import Cucumberish

class CheckingSpellsSteps: CheckingSpellsScreen {
    func CheckingSpellsStepsImplementation() {
        Given("that I have opened the app") { _,_ in
            self.app.launch()
        }
        
        And("I see the list of spells") { _,_ in
            XCTAssertTrue(self.app.tables[UITestID.spellList].exists)
        }
        
        When("I tap on any given spell") { _,_ in
            let firstCell = self.app.tables[UITestID.spellList].cells.element(boundBy: 0)
            guard firstCell.waitForExistence(timeout: 2) else {
                return XCTFail("First cell not found.")
            }
            firstCell.tap()
        }
        
        Then("I see the spell details") { _,_ in
            guard self.app.staticTexts["spell_title"].exists else {
                return XCTFail("Título não existe.")
            }
        }
        
        And("I see a description of what that spell does") { _,_ in
            guard self.app.textViews["spell_description"].exists else {
                return XCTFail("Descrição não existe.")
            }
        }
    }
}
