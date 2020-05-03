//
//  Copyright © 2020 Rafael Claycon Schmitt
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var favoriteButton: UIBarButtonItem!
    @IBOutlet var spellName: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var spellDescription: UITextView!

    var item: Spell! {
        didSet {
            navigationItem.title = item.name
            if item.isFavorite {
                setFavoriteIconIsFavorite()
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        spellName.text = item.name
        spellDescription.text = item.description
        spellName.accessibilityIdentifier = "spell_title"
        spellDescription.accessibilityIdentifier = "spell_description"
        
        if item.image != nil {
            imageView.image = item.image
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Clear first responder
        view.endEditing(true)
    }

    @IBAction func backgroundTapped(_: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func markFavorite(_: UIButton) {
        if item.isFavorite {
            showAlert(title: "Remove Favorite?", message: "")
            setFavoriteIconNotFavorite()
        } else {
            item.isFavorite = true
            setFavoriteIconIsFavorite()
            DispatchQueue.main.async {
                ToastOverlay.shared.show()
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
                ToastOverlay.shared.hide()
            })
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        present(alert, animated: true, completion: nil)
    }
    
    private func setFavoriteIconNotFavorite() {
        favoriteButton.image = UIImage(systemName: "star")
    }
    
    private func setFavoriteIconIsFavorite() {
        favoriteButton.image = UIImage(systemName: "star.fill")
    }
}
