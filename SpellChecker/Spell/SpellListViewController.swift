//
//  Copyright © 2020 Rafael Claycon Schmitt
//

import UIKit

class SpellListViewController: UITableViewController {
    var spellStore: SpellStore!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        navigationItem.leftBarButtonItem = editButtonItem
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        tableView.reloadData()
        tableView.accessibilityIdentifier = UITestID.spellList
    }
    
    @IBAction func sortSpells(_: UIBarButtonItem) {
        let alert = UIAlertController(title: LocalizableStrings.sortByPopupTitle, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: LocalizableStrings.aToZSortOption, style: .default, handler: { _ in
            NSLog("The \"A to Z\" option was picked.")
        }))
        alert.addAction(UIAlertAction(title: LocalizableStrings.favoritesAtTheTopSortOption, style: .default, handler: { _ in
            NSLog("The \"Favorites At the Top\" option was picked.")
        }))
        alert.addAction(UIAlertAction(title: LocalizableStrings.dateAddedSortOption, style: .default, handler: { _ in
            NSLog("The \"Date Added\" option was picked.")
        }))
        alert.addAction(UIAlertAction(title: LocalizableStrings.customSortOption, style: .default, handler: { _ in
            NSLog("The \"Custom\" option was picked.")
        }))
        alert.addAction(UIAlertAction(title: LocalizableStrings.cancel, style: .cancel, handler: { _ in
            NSLog("The \"Cancel\" option was picked.")
        }))
        present(alert, animated: true, completion: nil)
    }

    @IBAction func addNewItem(_: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(identifier: "NewSpellViewController") as! NewSpellViewController
        secondVC.modalPresentationStyle = .formSheet
        secondVC.completionHandler = { add, item in
            guard add else {
                return false
            }
            guard let newItem = item else {
                return false
            }
            guard !self.spellStore.spellAlreadyExists(newItem.name) else {
                return false
            }

            self.spellStore.insertItem(newItem)
            
            let firstLetter = newItem.name.prefix(1)
            guard let subArrayIndex = SpellStore.getSubArrayIndex(for: firstLetter) else {
                fatalError("getSubArrayIndex() is not prepared for the first letter of \(newItem.name).")
            }
            if let index = self.spellStore.allItems[subArrayIndex].index(of: newItem) {
                let indexPath = IndexPath(row: index, section: 0)
                self.tableView.insertRows(at: [indexPath], with: .automatic)
            }
            return true
        }
        present(secondVC, animated: true, completion: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender _: Any?) {
        // If the triggered segue is the "showItem" segue
        switch segue.identifier {
        case "showItem"?:
            // Figure out which row was just tapped
            if let row = tableView.indexPathForSelectedRow?.row {
                // Get the item associated with this row and pass it along
                // TODO: Prepare New Spell for alphabetical section headers
                let item = spellStore.allItems[tableView.indexPathForSelectedRow!.section][row]
                let detailViewController = segue.destination as! SpellDetailViewController
                detailViewController.item = item
            }
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }

    override func tableView(_: UITableView,
                            moveRowAt sourceIndexPath: IndexPath,
                            to destinationIndexPath: IndexPath) {
        // Update the model
        //spellStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row, item: spellStore.allItems[])
    }

    override func tableView(_: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        // If the table view is asking to commit a delete command...
        if editingStyle == .delete {
            let item = spellStore.allItems[indexPath.row]

            // Remove the item from the store
            //spellStore.removeItem(item)

            // Also remove that row from the table view with an animation
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

    override func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spellStore.allItems[section].count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return spellStore.allItems.count
    }

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create an instance of UITableViewCell, with default appearance
        let cell = tableView.dequeueReusableCell(withIdentifier: "SpellCell",
                                                 for: indexPath) as! SpellCell

        // Set the text on the cell with the description of the item
        // that is at the nth index of items, where n = row this cell
        // will appear in on the tableview
        let item = spellStore.allItems[indexPath.section][indexPath.row]

        if item.isFavorite {
            let imageAttachment = NSTextAttachment()
            let star = UIImage(systemName: "star.fill")
            let orangeStar = star?.withTintColor(UIColor.orange, renderingMode: .alwaysOriginal)
            imageAttachment.image = orangeStar

            let fullString = NSMutableAttributedString(string: item.name + " ")
            fullString.append(NSAttributedString(attachment: imageAttachment))
            cell.nameLabel.attributedText = fullString
        } else {
            cell.nameLabel.text = item.name
        }

        return cell
    }

    override func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return 64
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return SpellStore.getLetter(for: section)
    }
}
