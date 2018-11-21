//
//  Game.swift
//  WarGame
//
//  Created by jean-michel zaragoza on 03/10/2018.
//  Copyright © 2018 Lucas HACHER. All rights reserved.
//

import Foundation


class Game {
    
    var currentAttackTeam = team1
    var currentTargetTeam =  team2
    var lifeTeamAttack = 0
    var lifeTeamTarget = 0
    var data: Int = 0
    
   
    
    var currentAttackCharacter: Character!
    var currentTargetCharacter:  Character!
    
    
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
                        currentCharacter = Character(name: "\(inputNom)", roleName: "Fighter", life: 100)
                        print("Description de \(currentCharacter.name) \n Role:  \(currentCharacter.roleName) \n Vie: \(currentCharacter.life) \n Arme: \(currentCharacter.arme!.degats)")
                    case "2":
                        role = true
                        currentCharacter = Character(name: "\(inputNom)", roleName: "Wizard", life: 100)
                        print("Description de \(currentCharacter.name) \n Role:  \(currentCharacter.roleName) \n Vie: \(currentCharacter.life) \n Arme: \(currentCharacter.arme!.degats)")
                    case "3":
                        role = true
                        currentCharacter = Character(name: "\(inputNom)", roleName: "Colossus", life: 100)
                        
                        print("Description de \(currentCharacter.name) \n Role:  \(currentCharacter.roleName) \n Vie: \(currentCharacter.life) \n Arme: \(currentCharacter.arme!.degats)")
                    case "4":
                        role = true
                        currentCharacter = Character(name: "\(inputNom)", roleName: "Dwarf", life: 100)
                        print("Description de \(currentCharacter.name) \n Role:  \(currentCharacter.roleName) \n Vie: \(currentCharacter.life) \n Arme: \(currentCharacter.arme!.degats)")
                    default:
                        role = false
                        print("Erreur de saisie !")
                    }
                    
                    print()
                    
                }
                
                
            } while role == false

        } // end of : if let inputNom = readLine()
        
        return currentCharacter
        
        
        
    } // End of createCurrentCharacter()
    

    
    func input() -> Int {
        
        let strData = readLine();
        
        return Int(strData!)!
    }

    
    
    
    
    
    // MARK: Boucle combat
    func fight() {
        
        var counter: Int = 0
  
        currentAttackTeam = team1
        currentTargetTeam = team2
        
        // prévoir une algorithmie aléatoire pour qui démarre
        
        repeat {
            
            counter += 1
            
            choiceFighters()
            
            print("================ Round numéro \(counter) ================")
            
            lifeTeamAttack = currentAttackTeam.character1.life + currentAttackTeam.character2.life + currentAttackTeam.character3.life
            lifeTeamTarget = currentTargetTeam.character1.life + currentTargetTeam.character2.life + currentTargetTeam.character3.life
            
            
            theFight()
            
            
            
        } while true // sortir si une des équipe est entièrement morte
                    // ou si le seul survivant attaquant est un mage

        
        
    } // end of : func fight()
    
    
    
    
    
    
    
     func choiceFighters() {
        
                repeat {
                    
                    print(currentAttackTeam)
                    print(currentAttackTeam.name)
                    print(currentAttackTeam.character1.name)
                    print("")
                    
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
    
    
    func theFight() {
    
        print("")
        print("Le combat a lieu entre :")
        print("currentAttackCharacter : \(currentAttackCharacter.name) \(currentAttackCharacter.life)")
        print("currentTargetCharacter : \(currentTargetCharacter.name) \(currentTargetCharacter.life)")
        print("")
        
        //le combat
        currentTargetCharacter.life = currentTargetCharacter.life - currentAttackCharacter.arme!.degats
        
        //currentTargetCharacter.life = currentTargetCharacter.life - currentAttackCharacter.armes.dommage
        print("Il en résulte :")
        print("currentAttackCharacter : \(currentAttackCharacter.name) \(currentAttackCharacter.life)")
        print("currentTargetCharacter : \(currentTargetCharacter.name) \(currentTargetCharacter.life)")
        print("")
        print("la vie de l'équipe attaquant est de :  \(lifeTeamAttack)" )
        print("")
        print("la vie de l'équipe attaquer est de :  \(lifeTeamTarget)" )

    
    }

} // end of : Class

