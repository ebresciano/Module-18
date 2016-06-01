//
//  ImageController.swift
//  DeckOfOneCard
//
//  Created by Eva Marie Bresciano on 6/1/16.
//  Copyright © 2016 Eva Bresciano. All rights reserved.
//

import Foundation
import UIKit


class ImageController {
    
    static func imageForURL(url: String, completion:((image: UIImage?) -> Void)) {
        guard let url = NSURL(string: url) else {fatalError("Image URL optional, optional is nil")}
        NetWorkController.performRequestForURL(url, httpMethod: .Get) { (data, error) in
            guard let data = data else {
                completion(image: nil)
                return
            }
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            completion(image: UIImage(data: data))
           })
        }
    }
}
