//
//  CardController.swift
//  DeckOfOneCard
//
//  Created by Eva Marie Bresciano on 6/1/16.
//  Copyright © 2016 Eva Bresciano. All rights reserved.
//

import Foundation

class CardController {
    
    static let baseURL = NSURL(string: "http://deckofcardsapi.com/api/deck/new/draw/")
    
    static func drawCards(numberOfCards: Int, completion: ((card: [Card]) -> Void )) {
        
    }
}