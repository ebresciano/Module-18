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
    
    static func drawCards(numberOfCards: Int, completion: ((cards: [Card]) -> Void )) {
        guard let url = self.baseURL else {fatalError("URL optional is nil")}
        
        let urlParameters = ["count": "\(numberOfCards)"]
        
        NetWorkController.performRequestForURL(url, httpMethod: .Get, urlParameters: urlParameters) { (data, error) in
            if let data = data,
                responseDataString = NSString(data: data, encoding: NSUTF8StringEncoding) {
                guard let responseDictionary = (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)) as? [String:AnyObject],
                    cardDictionaries = responseDictionary["cards"] as? [[String:AnyObject]] else {
                        print("Unable to serialize JSON. \nResponse: \(responseDataString)")
                        completion(cards: [])
                        return
                }
                let cards = cardDictionaries.flatMap{Card(dictionary:$0)}
                completion(cards: cards)
                
            } else {
                print("No data returned from network request.")
                completion(cards: [])
            }
        }
        
    }
}