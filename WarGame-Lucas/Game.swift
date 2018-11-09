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
    
    
    
    func input() -> Int {
        
        let strData = readLine();
        
        return Int(strData!)!
    }


    
     func jouer() {
        
        var data: Int
        
        let currentAttackTeam = team1
        let currentTargetTeam =  team2
     
        var currentAttackCharacter: Character!
        var currentTargetCharacter:  Character!
     // prévoir une algorithmie aléatoire pour qui démarre

     

                repeat {
                        print("Choix personnage attaquant :"
                            + "\n1. \(currentAttackTeam.character1.name) "
                            + "\n2. \(currentAttackTeam.character2.name)"
                            + "\n3. \(currentAttackTeam.character3.name)")
     
                    data = input()
     
                        } while data != 1 && data != 2 && data != 3
     
        
        print("choixAttaquant : \(data)")
        
            var choice: Bool = true
            repeat {

                    switch data{
                    case 1:
                        choice = true
                        currentAttackCharacter = currentAttackTeam.character1
                        currentTargetCharacter = choiceAttack()
                        
                    case 2:
                        choice = true
                        currentAttackCharacter = currentAttackTeam.character2
                        currentTargetCharacter = choiceAttack()
                        
                    case 3:
                        choice = true
                        currentAttackCharacter = currentAttackTeam.character3
                        currentTargetCharacter = choiceAttack()
                    default :
                        choice = false
                        print("XXXXXXXerreur ")
                    
                }
            }while choice == false

        
        print("currentAttackCharacter : \(currentAttackCharacter.name)")
        print("currentTargetCharacter : \(currentTargetCharacter.name)")
        
        
        //IMPORTANT
        //ici on a nos 2 combattants :
        // currentAttackCharacter
        // currentTargetCharacter
        
        //appeler une fonction (à écrire) pour le LE COMBAT EFFECTIF
        
        //instruction de base dans la fonction
        //currentTargetCharacter.life = currentTargetCharacter.life - currentAttackCharacter??????
        
        
        
    } // func jouer()
    
    
        func choiceAttack() -> Character{
            
            var data: Int

            repeat{
                print("Quel choix ?")
                print("1. Attaquer")
                print("2. Améliorer son arme")
                
                data = input()
                
            }while data != 1 && data != 2
            
            var choiceAttackTeam: Bool = true
            repeat {
                
                    switch data{
                    case 1:
                        choiceAttackTeam = true
                        return attackOpponent()
                        
                    default :
                        choiceAttackTeam = false
                        print("erreur ")
                        
                }
            }while choiceAttackTeam == false
            
        }
        
    
    func attackOpponent() -> Character {
        
        let currentTargetTeam =  team2
        
        var data: Int
        
        repeat {
        print("Choix personnage Cible :"
        + "\n1. \(currentTargetTeam.character1.name) "
        + "\n2. \(currentTargetTeam.character2.name)"
        + "\n3. \(currentTargetTeam.character3.name)")
        
        data  = input()
        
        } while data != 1 && data != 2 && data != 3
        
        
        var choice: Bool = true
        repeat {
        
        switch data{
        case 1:
        choice = true
        return currentTargetTeam.character1
        
        case 2:
        choice = true
        return currentTargetTeam.character2
        
        case 3:
        choice = true
        return currentTargetTeam.character3
        default :
        choice = false
        print("ZZZZZZZZZZerreur ")
        
        }
        }while choice == false
        //var curtentAttackCharacter =
        
    
    } // func attackOpponent()

    
    
} // end of : Class

