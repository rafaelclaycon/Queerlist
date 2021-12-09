import Foundation
import Cucumberish

class ReadingDetailsSteps: ReadingDetailsScreen {

    func ReadingDetailsStepsImplementation() {
        Given("that I have opened the app") { _,_ in
            self.app.launch()
        }
        
        And("I see the list of personalities") { _,_ in
            XCTAssertTrue(self.app.tables[UITestID.personalityList].exists)
        }
        
        When("I tap on any given personality") { _,_ in
            let firstCell = self.app.tables[UITestID.personalityList].cells.element(boundBy: 0)
            guard firstCell.waitForExistence(timeout: 2) else {
                return XCTFail("First cell not found.")
            }
            firstCell.tap()
        }
        
        Then("I see the personality details") { _,_ in
            guard self.app.staticTexts[UITestID.personalityTitle].exists else {
                return XCTFail("Title not found.")
            }
        }
        
        And("I see a brief description of who that person is") { _,_ in
            guard self.app.textViews[UITestID.personalityDescription].exists else {
                return XCTFail("Description not found.")
            }
        }
    }

}
