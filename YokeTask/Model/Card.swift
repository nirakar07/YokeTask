//
//  Card.swift
//  YokeHome
//
//  Created by Nirakar Sapkota on 8/12/20.
//  Copyright © 2020 Nirakar. All rights reserved.
//

import Foundation

struct Card: Decodable  {
    var stars: [Star]
}


struct Star: Decodable, Identifiable{
    var id: String{
        return UUID().uuidString
    }
    let name: String
    let bio: String
    let isOnline: Bool
}
