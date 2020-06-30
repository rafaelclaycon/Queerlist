//
//  CreatingSpellsSteps.swift
//  SpellCheckerUITests
//
//  Created by Rafael Schmitt on 29/06/20.
//  Copyright © 2020 Rafael Claycon Schmitt. All rights reserved.
//

import Foundation
import Cucumberish

class CreatingSpellsSteps: CheckingSpellsScreen {
    func CreatingSpellsStepsImplementation() {
        When("I tap the plus button at the top") { _,_ in
            let newSpellButton = self.app.buttons[UITestID.newSpellButton]
            XCTAssertTrue(newSpellButton.waitForExistence(timeout: 3))
            newSpellButton.tap()
        }
        
        Then("I see the New Spell screen") { _,_ in
            let newSpellScreen = self.app.otherElements[UITestID.newSpellScreen]
            XCTAssertTrue(newSpellScreen.waitForExistence(timeout: 3))
        }
        
        MatchAll("I see the new spell name field") { _,_ in
            let spellNameField = self.app.textFields[UITestID.spellNameField]
            XCTAssertTrue(spellNameField.waitForExistence(timeout: 3))
        }
        
        When("I tap that field") { _,_ in
            let spellNameField = self.app.textFields[UITestID.spellNameField]
            spellNameField.tap()
        }
        
        When("I type \"([^\\\"]*)\"") { args,_ in
            guard let spellName = args?[0] else {
                return XCTFail("No new spell name provided.")
            }
            let spellNameField = self.app.textFields[UITestID.spellNameField]
            spellNameField.typeText(spellName)
        }
    }
}
