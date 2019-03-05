//
//  Character.swift
//  WarGame
//
//  Created by jean-michel zaragoza on 03/10/2018.
//  Copyright © 2018 Lucas HACHER. All rights reserved.
//


import Foundation

class Character: Game {
    
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
    
    func majMaxLife() {
        // MAJ DES NIVEAUX DE VIES MAX OU MIN
        
        if currentAttackCharacter.life > constants.MAX_LIFE {
            currentAttackCharacter.life = constants.MAX_LIFE
        }
        
     
        if currentTargetCharacter.life > constants.MAX_LIFE {
            currentTargetCharacter.life = constants.MAX_LIFE
        }
    }
            
    func majMinLife() {
            
        if currentAttackCharacter.life < constants.MIN_LIFE {
            currentAttackCharacter.life = constants.MIN_LIFE
        }
            
        if currentTargetCharacter.life < constants.MIN_LIFE {
            currentTargetCharacter.life = constants.MIN_LIFE
        }
    }
    
    func coffre() {


        let coffre:Bool
        let nbr = Int.random(in: 1 ... 100)
        if nbr <= 100 {
            coffre = true
        } else {
            coffre = false
        }
        
        if coffre == true {
            arme = Legende()
    }
    }
} // end of : class Character 

