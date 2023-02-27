//
//  DrinkModel.swift
//  HomeWork N3 (5)
//
//  Created by Magdiel Altynbekov on 13/2/23.
//

import Foundation
import UIKit

struct Coctail: Decodable{
    var drinks: [Drinks]
}

struct Drinks: Decodable{
    var strDrink: String
    var strDrinkThumb: String
}
struct ABC{
    var name: String
    var comment: String
}
struct DEF{
    var name: String
    
}
