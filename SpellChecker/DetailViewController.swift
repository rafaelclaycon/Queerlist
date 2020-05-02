//
//  Copyright © 2020 Rafael Claycon Schmitt
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var spellName: UILabel!
    @IBOutlet var spellDescription: UITextView!

    var item: Item! {
        didSet {
            navigationItem.title = item.name
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        spellName.text = item.name
        spellDescription.text = item.description
        spellName.accessibilityIdentifier = "spell_title"
        spellDescription.accessibilityIdentifier = "spell_description"
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Clear first responder
        view.endEditing(true)
    }

    @IBAction func backgroundTapped(_: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}
