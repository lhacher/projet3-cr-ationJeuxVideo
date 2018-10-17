//
//  Team.swift
//  WarGame
//
//  Created by jean-michel zaragoza on 03/10/2018.
//  Copyright © 2018 Lucas HACHER. All rights reserved.
//

import Foundation


class Team {
    
    var name: String
    
    var character1: Character
    var character2: Character
    var character3: Character
    
    init(name: String, character1: Character, character2: Character, character3: Character) {
        self.name = name
        self.character1 = character1
        self.character2 = character2
        self.character3 = character3
    }
}

