//
//  Game.swift
//  WarGame
//
//  Created by jean-michel zaragoza on 03/10/2018.
//  Copyright © 2018 Lucas HACHER. All rights reserved.
//

import Foundation




class Game {
    
    
   
    // Variables globales
   
    var currentCharacter: Character!
    
    var team1: Team!
    var team2: Team!
    
    var currentAttackTeam: Team!
    var currentTargetTeam:  Team!
    
    var lifeTeam1: Int = 0
    var lifeTeam2: Int = 0
    var data: Int = 0
    
    var currentAttackCharacter: Character!
    var currentTargetCharacter:  Character!
    
    
    
    
    
    func runGame() {
        
        createTeam1()
        createTeam2()
        team1.getInfos()
        team2.getInfos()
        //// LE CASTING EST FAIT, PLACE AU COMBAT
        fight()
        winner()
    }
    
    
    /**
     création des personnages de l'équipe 1
     */
    func createTeam1() {
        
        let character1 = game.createCurrentCharacter(characterNum: 1)
        
        let character2 = game.createCurrentCharacter(characterNum: 2)
        
        let character3 = game.createCurrentCharacter(characterNum: 3)
        
        self.team1 = Team(name: "Équipe 1", character1: character1, character2: character2, character3: character3)
        
    }
    
    /**
     création des personnages de l'équipe 2
     */
    func createTeam2() {
        
        let character1 = game.createCurrentCharacter(characterNum: 1)
        
        let character2 = game.createCurrentCharacter(characterNum: 2)
        
        let character3 = game.createCurrentCharacter(characterNum: 3)
        
        self.team2 = Team(name: "Équipe 2", character1: character1, character2: character2, character3: character3)
        
    }
    
    

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
                        print("Description de \(currentCharacter.name) \n Role:  \(currentCharacter.roleName) \n Vie: \(currentCharacter.life) \n Arme: \(currentCharacter.arme!.degats))")
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
                            + "\n1. \(currentAttackTeam.tabCharacters[0].name) ( \(currentAttackTeam.tabCharacters[0].roleName)  )"
                            + "\n2. \(currentAttackTeam.tabCharacters[1].name) ( \(currentAttackTeam.tabCharacters[1].roleName)  )"
                            + "\n3. \(currentAttackTeam.tabCharacters[2].name) ( \(currentAttackTeam.tabCharacters[2].roleName)  )")
     
                    data = input()
     
                        } while data != 1 && data != 2 && data != 3
     
        
        //print("choixAttaquant : \(data)")
        
            var choice: Bool = true
            repeat {

                    switch data{
                    case 1:
                        choice = true
                        if currentAttackTeam.tabCharacters[0].life == 0 {
                            print("CurrentAttack is dead, try aguain ")
                            choiceFighters()
                        }
                        else if currentAttackTeam.tabCharacters[0].roleName == "Wizard" {
                        currentAttackCharacter = currentAttackTeam.tabCharacters[0]
                        currentTargetCharacter = healthTeam()
 
                        }else{
                        currentAttackCharacter = currentAttackTeam.tabCharacters[0]
                        currentTargetCharacter = choiceAttack()
                        }
                        
                    case 2:
                        choice = true
                        currentAttackCharacter = currentAttackTeam.tabCharacters[1]
                        currentTargetCharacter = choiceAttack()
                        
                    case 3:
                        choice = true
                        currentAttackCharacter = currentAttackTeam.tabCharacters[2]
                        currentTargetCharacter = choiceAttack()
                    default :
                        choice = false
                        print("erreur ")
                    
                }
            }while choice == false
        
    } // func choiceFighters()
    
    
    // func which treat his companion
    func healthTeam() -> Character{
        
        repeat {
            print("Choix personnage Ciblesssssss :"
                + "\n1. \(currentAttackTeam.tabCharacters[0].name) ( \(currentAttackTeam.tabCharacters[0].roleName)  ) "
                + "\n2. \(currentAttackTeam.tabCharacters[1].name) ( \(currentAttackTeam.tabCharacters[1].roleName)  )"
                + "\n3. \(currentAttackTeam.tabCharacters[2].name) ( \(currentAttackTeam.tabCharacters[2].roleName)  )")
            
            data  = input()
            
        } while data != 1 && data != 2 && data != 3
        
        
        var choice: Bool = true
        repeat {
            
            switch data{
            case 1:
                choice = true
                return currentAttackTeam.tabCharacters[0]
                
            case 2:
                choice = true
                return currentAttackTeam.tabCharacters[1]
                
            case 3:
                choice = true
                return currentAttackTeam.tabCharacters[2]
            default :
                choice = false
                print("erreur ")
                
            }
        }while choice == false
    }//func healthTeam
    
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
                     /*   if currentCharacter.roleName == "Wizard"{
                            
                            return healthTeam()
                        }else{*/
                            return attackOpponent()
                      //  }
                        
                   
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
        + "\n1. \(currentTargetTeam!.tabCharacters[0].name) "
        + "\n2. \(currentTargetTeam!.tabCharacters[1].name)"
            + "\n3. \(currentTargetTeam!.tabCharacters[2].name)")
        
        data  = input()
        
        } while data != 1 && data != 2 && data != 3
        
        
        var choice: Bool = true
        repeat {
        
        switch data{
        case 1:
        choice = true
        return currentTargetTeam!.tabCharacters[0]
        
        case 2:
        choice = true
        return currentTargetTeam!.tabCharacters[1]
        
        case 3:
        choice = true
        return currentTargetTeam!.tabCharacters[2]
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
            
            currentAttackCharacter.life = currentAttackCharacter.life + currentAttackCharacter.arme!.soins
            
        }else{
        // éventuellement prévoir des aléas aléatoires de combat (esquive, contre-attaque, coffre....)
            
        //func random which dodges or not the attack
        let esquive = Bool.random()
        
        if esquive == true {
            
            print("L'adversaire à esquivé l'attaque et contre-attaque")
            currentAttackCharacter.life = currentAttackCharacter.life - (currentTargetCharacter.arme!.degats)
            
            
        }else {
        
        // initial fight
        currentTargetCharacter.life = currentTargetCharacter.life - (currentAttackCharacter.arme!.degats)
            
        }
        }
      
        if currentAttackCharacter.life > 100 {
            currentAttackCharacter.life = 100
        }else if currentTargetCharacter.life > 100{
            currentTargetCharacter.life = 100
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

