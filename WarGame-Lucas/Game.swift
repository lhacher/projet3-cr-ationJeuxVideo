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
    var lifeTeam1 = 0
    var lifeTeam2 = 0
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

    
    /*func randomTeamStart() {
   
     
        }
        
      
        
 }*/ //func randomTeamStart()

    
    // MARK: Boucle combat
    func fight() {
        
        var counter: Int = 0
  
       


        
        repeat {
            
            counter += 1
            
            if counter == 1 {
                
                // start random()
                let celebrity = Bool.random()
                
                if celebrity {
                    currentAttackTeam = team1
                    currentTargetTeam = team2
                }
                else {
                    currentAttackTeam = team2
                    currentTargetTeam = team1
                }
                
            } else {
                
                swap(&currentAttackTeam, &currentTargetTeam)
                
            }
            
            
            print("================ Round numéro \(counter) ================")
            
            choiceFighters()

            lifeTeam1 = team1.teamLife()
            lifeTeam2 = team2.teamLife()
            
            print("")
            print("lifeTeam1 Avant : \(lifeTeam1)")
            print("lifeTeam2 Avant : \(lifeTeam2)")
            print("")
            
            theFight()
            
            lifeTeam1 = team1.teamLife()
            lifeTeam2 = team2.teamLife()
            
            print("")
            print("lifeTeam1 Après : \(lifeTeam1)")
            print("lifeTeam2 Après : \(lifeTeam2)")
            print("")
            
            
        } while  lifeTeam1 != 0 || lifeTeam2 != 0
        
        
    } // end of : func fight()
    
    
    
    
    
    
    
     func choiceFighters() {
        
                repeat {
                    
                        print("Choix personnage attaquant :"
                            + "\n1. \(currentAttackTeam.character1.name) "
                            + "\n2. \(currentAttackTeam.character2.name)"
                            + "\n3. \(currentAttackTeam.character3.name)")
     
                    data = input()
     
                        } while data != 1 && data != 2 && data != 3
     
        
        //print("choixAttaquant : \(data)")
        
            var choice: Bool = true
            repeat {

                    switch data{
                    case 1:
                        choice = true
                    /*   if currentAttackCharacter.life == 100{
                        currentAttackCharacter = currentAttackTeam.character1
                        currentTargetCharacter = healthTeam()
 
                        }else{*/
                        currentAttackCharacter = currentAttackTeam.character1
                        currentTargetCharacter = choiceAttack()
                        //}
                        
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
                        print("erreur ")
                    
                }
            }while choice == false
        
    } // func choiceFighters()
    
    func healthTeam() -> Character{
        
        repeat {
            print("Choix personnage Cible :"
                + "\n1. \(currentAttackTeam.character1.name) "
                + "\n2. \(currentAttackTeam.character2.name)"
                + "\n3. \(currentAttackTeam.character3.name)")
            
            data  = input()
            
        } while data != 1 && data != 2 && data != 3
        
        
        var choice: Bool = true
        repeat {
            
            switch data{
            case 1:
                choice = true
                return currentAttackTeam.character1
                
            case 2:
                choice = true
                return currentAttackTeam.character2
                
            case 3:
                choice = true
                return currentAttackTeam.character3
            default :
                choice = false
                print("erreur ")
                
            }
        }while choice == false
    }
    
        func choiceAttack() -> Character{
            
            var data: Int

            repeat{
                print("Quel choix ?")
                print("1. Attaquer")
                print("2. Améliorer son arme")
                
                data = input()
                
            }while data != 1 && data != 2
            
       /*     if data == 1 {
                return attackOpponent()
            }else if data == 2 {
                improveArms()
            }*/
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
            
        }// func choiceAttack
        

    
    func attackOpponent() -> Character {
        
        let currentTargetTeam =  self.currentTargetTeam
        
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
        print("erreur ")
        
        }
        }while choice == false
        
        
    } // func attackOpponent()
    
    
    func theFight() {
    
        print("")
        print("Le combat a lieu entre :")
        print("currentAttackCharacter : \(currentAttackCharacter.name) \(currentAttackCharacter.life)")
        print("currentTargetCharacter : \(currentTargetCharacter.name) \(currentTargetCharacter.life)")
        print("")
        
        if currentAttackCharacter.roleName == "Wizard"{
            
            currentAttackCharacter.life = currentAttackCharacter.life + currentAttackCharacter.arme!.degats
            
        }else{
        // éventuellement prévoir des aléas aléatoires de combat (esquive, contre-attaque, coffre....)
        let esquive = Bool.random()
        
        if esquive == true {
            
            print("L'adversaire à esquivé l'attaque et contre-attaque")
            currentAttackCharacter.life = currentAttackCharacter.life - (currentTargetCharacter.arme!.degats)
            
            
        }else {
        
        // initial fight
        currentTargetCharacter.life = currentTargetCharacter.life - (currentAttackCharacter.arme!.degats)
            
        }
        }
      
        if currentAttackCharacter.life < 0{
            currentAttackCharacter.life = 0
            
        }else if currentTargetCharacter.life < 0{
            currentTargetCharacter.life = 0
        }
        

        print("Il en résulte :")
        print("currentAttackCharacter : \(currentAttackCharacter.name) \(currentAttackCharacter.life)")
        print("currentTargetCharacter : \(currentTargetCharacter.name) \(currentTargetCharacter.life)")
        print("")

    
    } //end of func theFight()
    
    
    func winner() {
    
        if lifeTeam1 == 0 {
            print("Les vainqueur sont la Team2")
        }
        else{
            print("Les vainqueur sont la Team1")
        }
    }//end of func winner()

} // end of : Class

