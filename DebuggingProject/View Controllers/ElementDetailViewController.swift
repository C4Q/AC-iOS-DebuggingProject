//
//  ElementDetailViewController.swift
//  MidtermElements-InstructorNotes
//
//  Created by C4Q  on 12/7/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ElementDetailViewController: UIViewController {

    @IBOutlet weak var boilingLabel: UILabel!
    @IBOutlet weak var meltingLabel: UILabel!
    @IBOutlet weak var discoveryLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var twoLetterLabel: UILabel!
    @IBOutlet weak var numLabel: UILabel!
    @IBOutlet weak var elementImageView: UIImageView!
    var element: Element!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        boilingLabel.text = "Boiling point: \(element.boilingPoint?.description ?? "n/a")"
        meltingLabel.text = "Melting point: \(element.meltingPoint?.description ?? "n/a")"
        discoveryLabel.text = "Discovery year: \(element.discoveryYearInt?.description ?? (element.discoveryYearStr ?? "n/a"))"
        weightLabel.text = "\(element.weight)"
        fullNameLabel.text = element.name
        twoLetterLabel.text = element.symbol
        numLabel.text = "\(element.number)"
        self.title = "\(element.name)"
        let imageStr = "http://images-of-elements.com/\(element.name.lowercased()).jpg"
        ImageAPIClient.manager.loadImage(from: imageStr, completionHandler: {
            self.elementImageView.image = $0
            self.view.setNeedsLayout()
        }, errorHandler: {print($0)})
    }
    @IBAction func favoritesButtonPressed(_ sender: UIButton) {
        FavoriteAPIClient.shared.post(favorite: Favorite(name: "Ben", favorite_element: element.name), errorHandler: {print($0)})
    }
}
