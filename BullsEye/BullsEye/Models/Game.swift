//
//  Game.swift
//  BullsEye
//
//  Created by Vodnikova Daria Konstantinovna on 30.04.2023.
//

import Foundation

struct Game {
    let target = Int.random(in: 1...100)
    let score = 0
    let round = 1
    
    func points(sliderValue: Int) -> Int{
        return 100-abs(sliderValue-target)
    }
}
