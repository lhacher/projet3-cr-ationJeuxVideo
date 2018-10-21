//
//  Character.swift
//  WarGame
//
//  Created by jean-michel zaragoza on 03/10/2018.
//  Copyright © 2018 Lucas HACHER. All rights reserved.
//


import Foundation

class Character {
    
    var name: String
    var roleName: String
    var life: Int
    var arme: String


    
    init(name: String, roleName: String,life: Int, arme: String) {
        self.name = name
        self.roleName = roleName
        self.life = life
        self.arme = arme
        
    }
}

