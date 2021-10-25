//
//  PlaceModel.swift
//  AppTable
//
//  Created by Kaznacheev on 25.10.2021.
//

import Foundation

struct Plase {
    
    var name: String
    var location: String
    var type: String
    var images: String
    
    
      static let restaurantNames = [
            "Burger Heroes", "Kitchen", "Bonsai", "Дастархан",
            "Индокитай", "X.O", "Балкан Гриль", "Sherlock Holmes",
            "Speak Easy", "Morris Pub", "Вкусные истории",
            "Классик", "Love&Life", "Шок", "Бочка"
        ]
    
    static func getPlasess() -> [Plase] {
        
        var plasess = [Plase]()
        
        for index in restaurantNames {
            plasess.append(Plase(name: index, location: "Краснодар", type: "Ресторан", images: index))
        }
        
        
        return plasess
    }
    
    
}
