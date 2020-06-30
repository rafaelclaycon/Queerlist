//
//  CucumberishInitializer.swift
//  bluemmUITests
//
//  Created by Rafael Schmitt on 21/02/19.
//  Copyright © 2020 SLB. All rights reserved.
//

import Cucumberish
import Foundation

@objc public class CucumberishInitializer: NSObject {
    @objc public class func CucumberishSwiftInit() {
        beforeStart { () -> Void in
            CheckingSpellsSteps().CheckingSpellsStepsImplementation()
            CreatingSpellsSteps().CreatingSpellsStepsImplementation()
        }

        let bundle = Bundle(for: CucumberishInitializer.self)

        Cucumberish.executeFeatures(inDirectory: "Features", from: bundle, includeTags: nil, excludeTags: nil)
    }
}
