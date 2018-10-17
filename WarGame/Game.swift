//
//  Game.swift
//  WarGame
//
//  Created by jean-michel zaragoza on 03/10/2018.
//  Copyright © 2018 Lucas HACHER. All rights reserved.
//

import Foundation


class Game {
    
    
    func createCurrentCharacter(characterNum: Int) -> Character {
        
        ///////////////////////////////////////////
        print("Nom du personnage numéro \(characterNum) ?")
        
        
        if let inputNom = readLine() {

            print()
            
            print("Quelle sera la classe de \(inputNom) ?"
                + "\n1. Combattant."
                + "\n2. Magicien."
                + "\n3. Colosse."
                + "\n4. Nain.")
            
            var role: Bool = false
            
            repeat {
                
                if let inputRole = readLine() {
                    switch inputRole {
                    case "1":
                        role = true
                        currentCharacter = Character(name: "\(inputNom)", roleName: "Fighter", life: 200, arme: "Épée")
                        print("Description de \(currentCharacter.name) \n Role:  \(currentCharacter.roleName) \n Vie: \(currentCharacter.life) \n Arme: \(currentCharacter.arme)")
                    case "2":
                        role = true
                        currentCharacter = Character(name: "\(inputNom)", roleName: "Wizard", life: 150, arme: "Sceptre")
                        print("Description de \(currentCharacter.name) \n Role:  \(currentCharacter.roleName) \n Vie: \(currentCharacter.life) \n Arme: \(currentCharacter.arme)")
                    case "3":
                        role = true
                        currentCharacter = Character(name: "\(inputNom)", roleName: "Colossus", life: 300, arme: "Bouclier")
                        
                        print("Description de \(currentCharacter.name) \n Role:  \(currentCharacter.roleName) \n Vie: \(currentCharacter.life) \n Arme: \(currentCharacter.arme)")
                    case "4":
                        role = true
                        currentCharacter = Character(name: "\(inputNom)", roleName: "Dwarf", life: 100, arme: "Hache")
                        print("Description de \(currentCharacter.name) \n Role:  \(currentCharacter.roleName) \n Vie: \(currentCharacter.life) \n Arme: \(currentCharacter.arme)")
                    default:
                        role = false
                        print("Erreur de saisie !")
                    }
                    
                    print()
                    
                }
                
                
            } while role == false
            
        
            
        }
       
        
        
        return currentCharacter
        
      
        
    } // End of createCurrentCharacter()
    
    // Fonction permettant de demander à l'utilisateur d'entrer un nombre entier
    func input() -> Int {
        let strData = readLine();
        
        return Int(strData!)!
    }
    
    func jouer(contre joueur : Character) {
        var choixUtilisateur: Int
        
        /*print("Choix personnage du joueur 1:"
            + " \n1.\(team1.character1.name) "
            + " \n2.\(team1.character2.name)"
            + " \n3.\(team1.character3.name)")
        */
        
        // On boucle tant qu'il n'a pas choisi un de ces deux solutions
        repeat {
            print("Quel choix ?")
            print("1. Attaquer")
            print("2. Améliorer son arme")
            choixUtilisateur = input()
            print()
        } while choixUtilisateur != 1 && choixUtilisateur != 2
        
        // On réalise l'action demandée
        /*if choixUtilisateur == 1 {
            self.attaquer(personnage: personnage)
        } else {
            self.ameliorerArme()
        }*/
       
    }
   

    
}
