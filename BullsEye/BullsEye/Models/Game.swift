//
//  Game.swift
//  BullsEye
//
//  Created by Vodnikova Daria Konstantinovna on 30.04.2023.
//

import Foundation

struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    
    func points(sliderValue: Int) -> Int{
        var result: Int = 100-abs(sliderValue-target)
        if (sliderValue == target){
            result+=100
        }
            
        if (abs(sliderValue-target) == 1){
            result+=50
        }
        return result
    }
    
    mutating func startNewRound(points: Int) {
        score+=points
        round+=1
        target = Int.random(in: 1...100)
    }
    
    mutating func restart(){
        score=0
        round = 1
        target = Int.random(in: 1...100)

    }
}
