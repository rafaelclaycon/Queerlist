import Cucumberish
import Foundation

@objc public class CucumberishInitializer: NSObject {

    @objc public class func CucumberishSwiftInit() {
        beforeStart { () -> Void in
            ReadingDetailsSteps().ReadingDetailsStepsImplementation()
        }

        let bundle = Bundle(for: CucumberishInitializer.self)

        Cucumberish.executeFeatures(inDirectory: "Features", from: bundle, includeTags: nil, excludeTags: nil)
    }

}
