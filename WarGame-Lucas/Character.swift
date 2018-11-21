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
    var arme: Arme?


    
    init(name: String, roleName: String,life: Int) {
        self.name = name
        self.roleName = roleName
        self.life = life
        
        //switch case fonction de la classe 1, 2, 3 ou 4
        switch roleName {
        case "Fighter":
            arme = Epees()
        case "Wizard":
            arme = Sceptre()
        case "Colossus":
            arme = Bouclier()
        case "Dwarf":
            arme = Hache()
        default:
            print("erreeeeeur")
            break
        }
    }  // end of init
}

