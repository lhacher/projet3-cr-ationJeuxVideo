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
    
    func choiceAttack() {
        var choiceAction: Int
        repeat{
        print("Quel choix ?")
        print("1. Attaquer")
       // print("2. Améliorer son arme")
            
            choiceAction = input()
            
        }while choiceAction != 1 && choiceAction != 2 && choiceAction != 3
        
        var choiceAttackTeam: Bool = true
        repeat {
            
            if let intChoice = readLine() {
                switch intChoice{
                case "1":
                    choiceAttackTeam = true
                    AttackOpponent()
                    
                default :
                    choiceAttackTeam = false
                    print("erreur ")
                    
                    
                }
            }
        }while choiceAttackTeam == false
    }
    
   
    
     func jouer() {
     
     // prévoir une algorithmie aléatoire pour qui démarre
        
     var currentAttackTeam = team1
     var currentTargetTeam = team2
     
     var choixAttaquant: Int
     var choixTarget: Int
     
     //Prévoir le choix du chartacter attaquant
     // On boucle tant qu'il n'a pas choisi un de ces deux solutions
        
      //  repeat {
                repeat {
                        print("Choix personnage attaquant :"
                            + "\n1. \(currentAttackTeam.character1.name) "
                            + "\n2. \(currentAttackTeam.character2.name)"
                            + "\n3. \(currentAttackTeam.character3.name)")
     
                    choixAttaquant = input()
     
                        } while choixAttaquant != 1 && choixAttaquant != 2 && choixAttaquant != 3
     
     //un switch/case pour valider le personnage attaquant
        
        
        
            var choice: Bool = true
            repeat {
            
                if let intChoice = readLine() {
                    switch intChoice{
                    case "1":
                        choice = true
                        choiceAttack()
                        
                    case "2":
                        choice = true
                        choiceAttack()
                        
                    case "3":
                        choice = true
                        choiceAttack()
                    default :
                        choice = false
                        print("erreur ")
                    
                    
                    }
                }
            }while choice == false
     //var curtentAttackCharacter = celui choisi
     
     
     //Prévoir le choix du chartacter Target
     // On boucle tant qu'il n'a pas choisi un de ces deux solutions
     repeat {
     print("Choix personnage Target :"
     + "\n1. \(currentTargetTeam.character1.name) "
     + "\n2. \(currentTargetTeam.character2.name)"
     + "\n3. \(currentTargetTeam.character3.name)")
     
     choixTarget = input()
     
     } while choixTarget != 1 && choixTarget != 2 && choixTarget != 3
     
     //faire un switch/case pour valider le personnage target
     //var currentTargetCharacter = celui choisi
     
        var choiceTarget: Bool = true
        repeat {
            
            if let intChoiceTarget = readLine() {
                switch intChoiceTarget{
                case "1":
                    choiceTarget = true
                    choiceAttack()
                    
                case "2":
                    choiceTarget = true
                    choiceAttack()
                    
                case "3":
                    choiceTarget = true
                    choiceAttack()
                default :
                    choice = false
                    print("erreur ")
                    
                    
                }
            }
        }while choiceTarget == false
     
     //ici on a nos 2 combattants : LE COMBAT EFFECTIF
     //currentTargetCharacter.life = currentTargetCharacter.life - curtentAttackCharacter.degats
     
        
        func AttackOpponent(currentTargetCharacter: Int, life: Int ) {
            
            currentTargetCharacter.life = currentTargetCharacter.life - currentTargetCharacter.degats
            
        }
        
     // test si currentTargetCharacter  est toujours en vie?
        
     
     // afficher le résumé
     
     // on permute les équipes et on boucle
            
    }while currentAttackTeam.character1.life != 0 && currentAttackTeam.character2.life && != 0 currentAttackTeam.character3.life != 0 || currentTargetTeam.character1.life != 0 && currentTargetTeam.character2.life != 0 && currentTargetTeam.character3.life != 0
    
    
    
}

