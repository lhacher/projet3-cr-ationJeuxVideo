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
   
    var tabCharacters = [Character]()
    
    init(name: String, character1: Character, character2: Character, character3: Character) {
        self.name = name
        
        self.tabCharacters.append(character1)
        self.tabCharacters.append(character2)
        self.tabCharacters.append(character3)
        
    }
    
    func teamLife () -> Int {
        var lifeTeam: Int = 0
        for idx in 0 ... 2 {
            lifeTeam = lifeTeam + self.tabCharacters[idx].life
        }
        return lifeTeam
    }
    
    
    func getInfos() {
    print("\(self.name)")
    print("")
    print("\(self.tabCharacters[0].name)")
    print("\(self.tabCharacters[1].name)")
    print("\(self.tabCharacters[2].name)")
    
    }

    
}

