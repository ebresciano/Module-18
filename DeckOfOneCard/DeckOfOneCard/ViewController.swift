//
//  ViewController.swift
//  DeckOfOneCard
//
//  Created by Eva Marie Bresciano on 6/1/16.
//  Copyright © 2016 Eva Bresciano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cardImageView: UIImageView!


    @IBAction func buttonTapped(sender: AnyObject) {
        CardController.drawCards(1) { (cards) in
            guard let card = cards.first else { return }
            ImageController.imageForURL(card.imageEndpoint, completion: { (image) in
                guard let image = image  else { return }
                self.cardImageView.image = image
            })
        }
    }

}

