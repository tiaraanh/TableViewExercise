//
//  Coffeeshop.swift
//  TableViewExercise
//
//  Created by Tiara H on 25/09/22.
//

import Foundation

struct Coffeeshop {
    let name: String?
    let type: String?
    let location: String?
    let image: String?
    var isFavorite: Bool = false
    
    init(name: String?, type: String?, location: String?, image: String?, isFavorite: Bool) {
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isFavorite = isFavorite
    }
}
