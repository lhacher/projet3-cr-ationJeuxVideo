//
//  main.swift
//  WarGame
//
//  Created by jean-michel zaragoza on 03/10/2018.
//  Copyright © 2018 Lucas HACHER. All rights reserved.
//

import Foundation

// Variables globales
var character1: Character?
var character2: Character?
var character3: Character?

var currentTeam: Team
var currentCharacter: Character
var returndedCharacter: Character
var returnJouer: Character


//instanciation de l'objet game
let game = Game()

// Création des 2 objets équipes
print("Création de l'équipes 1 \n")

/**
création des personnages de l'équipe 1
*/
returndedCharacter = game.createCurrentCharacter(characterNum: 1)
character1 = returndedCharacter


currentCharacter = game.createCurrentCharacter(characterNum: 2)
character2 = currentCharacter

currentCharacter = game.createCurrentCharacter(characterNum: 3)
character3 = currentCharacter

let team1 = Team(name: "Équipe 1", character1: character1!, character2: character2!, character3: character3!)



print("\(team1.name)")
print("")
print("\(team1.character1.name)")
print("\(team1.character2.name)")
print("\(team1.character3.name)")

// Création des 2 objets équipes
print("Création de l'équipes 2 \n")

//création des perosonnages de l'équipe 2

returndedCharacter = game.createCurrentCharacter(characterNum: 1)
character1 = returndedCharacter


currentCharacter = game.createCurrentCharacter(characterNum: 2)
character2 = currentCharacter

currentCharacter = game.createCurrentCharacter(characterNum: 3)
character3 = currentCharacter

let team2 = Team(name: "Équipe 2", character1: character1!, character2: character2!, character3: character3!)


print("\(team2.name)")
print("")
print("\(team2.character1.name)")
print("\(team2.character2.name)")
print("\(team2.character3.name)")


// LE CASTING EST FAIT, PLACE AU COMBAT



game.jouer()




print("end of game")




