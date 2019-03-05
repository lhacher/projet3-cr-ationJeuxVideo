//
//  Game.swift
//  WarGame
//
//  Created by jean-michel zaragoza on 03/10/2018.
//  Copyright © 2018 Lucas HACHER. All rights reserved.
//

import Foundation




class Game {
    
    
   
    //MARK: - Variables globales
   
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
    
    
    //MARK: - functions
    func runGame() {
        //// COMPOSITION DES EQUIPES
        print("-----------------------------WELCOME IN THIS GAME-----------------------------")
        print("")
        print("Name of team 1 ?")
        print("")
        if let inputTeam1 = readLine() {
            print()
            print("Name team one is \(inputTeam1)")
            print("")
            createTeam1(teamName: inputTeam1)
        }
        
        print("")
        
        
        print("Name of team 2 ?")
        print("")
        if let inputTeam2 = readLine() {
            print()
            print("Name team one is \(inputTeam2)")
            print("")
            createTeam2(teamName: inputTeam2)
        }
        
        team1.getInfos()
        team2.getInfos()
        
        //// LE CASTING EST FAIT, PLACE AU COMBAT
        fight()
        winner()
    
    }
    
    
    /**
     create perso team1
     */
    func createTeam1(teamName: String) {
        
        let character1 = game.createCurrentCharacter(characterNum: 1)
        
        let character2 = game.createCurrentCharacter(characterNum: 2)
        
        let character3 = game.createCurrentCharacter(characterNum: 3)
        
        self.team1 = Team(name: teamName, character1: character1, character2: character2, character3: character3)
        
    }
    
    /**
    create team 2
     */
    func createTeam2(teamName: String) {
        
        let character1 = game.createCurrentCharacter(characterNum: 1)
        
        let character2 = game.createCurrentCharacter(characterNum: 2)
        
        let character3 = game.createCurrentCharacter(characterNum: 3)
        
        self.team2 = Team(name: teamName, character1: character1, character2: character2, character3: character3)
        
    }
    
    

    func createCurrentCharacter(characterNum: Int) -> Character {
        
        print("Player's name \(characterNum) ?")
        
        
        if let inputNom = readLine() {
            
            print()
            
            print("Which will be the class of \(inputNom) ?"
                + "\n1. Fighter."
                + "\n2. Wizard."
                + "\n3. Colossus."
                + "\n4. Dwarf.")
            print("")
            var role: Bool = false
            
            repeat {
                
                if let inputRole = readLine() {
                    switch inputRole {
                    case "1":
                        role = true
                        currentCharacter = Character(name: "\(inputNom)", roleName: "Fighter", life: 100)
                        print("")
                        print("Description of \(currentCharacter.name) \n Role:  \(currentCharacter.roleName) \n Life: \(currentCharacter.life) \n Weapon: \(currentCharacter.arme!.degats))")
                    case "2":
                        role = true
                        currentCharacter = Character(name: "\(inputNom)", roleName: "Wizard", life: 100)
                        print("")
                        print("Description of \(currentCharacter.name) \n Role:  \(currentCharacter.roleName) \n Life: \(currentCharacter.life) \n Weapon: \(currentCharacter.arme!.degats)")
                    case "3":
                        role = true
                        currentCharacter = Character(name: "\(inputNom)", roleName: "Colossus", life: 100)
                        print("")
                        print("Description of \(currentCharacter.name) \n Role:  \(currentCharacter.roleName) \n Life: \(currentCharacter.life) \n Weapon: \(currentCharacter.arme!.degats)")
                    case "4":
                        role = true
                        currentCharacter = Character(name: "\(inputNom)", roleName: "Dwarf", life: 100)
                        print("")
                        print("Description of \(currentCharacter.name) \n Role:  \(currentCharacter.roleName) \n Life: \(currentCharacter.life) \n Weapon: \(currentCharacter.arme!.degats)")
                    default:
                        role = false
                        print("Input error !")
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

    
    // MARK: - Boucle combat
    func fight() {
        
        var counter: Int = 0
  
        
        repeat {
            
            counter += 1
            
            //// DETERMINATION DE L'EQUIPE ATTAQUANTE AU CAS 1 ET ENSUITE
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
            
            
            print("================ Round number \(counter) ================")
            print("")
            
            var fightOrWeapon: Bool
            
            fightOrWeapon = choiceFighters()

            lifeTeam1 = team1.teamLife()
            lifeTeam2 = team2.teamLife()
            
            print("")
            print("lifeTeam1 Before : \(lifeTeam1)")
            print("lifeTeam2 Before : \(lifeTeam2)")
            print("")
            
           // #warning ("theFight")
            
            // LE COMBAT
            if fightOrWeapon {
                print("Nouvelle arme pour \(currentAttackCharacter.name) \(String(describing: currentAttackCharacter.arme?.degats))")
            } else {
                 theFight()
            }
            
            // AFFECTATION DES VIES RESIDIUELLES
            lifeTeam1 = team1.teamLife()
            lifeTeam2 = team2.teamLife()
            
            print("")
            print("lifeTeam1 After : \(lifeTeam1)")
            print("lifeTeam2 After : \(lifeTeam2)")
            print("")
            
            
        } while  lifeTeam1 > 0 && lifeTeam2 > 0
        
    } // end of : func fight()
    
    
    
     func choiceFighters() -> Bool {
        
        var tempCharacter: Character = currentAttackTeam.tabCharacters[0]
        
            var choice: Bool = true
                repeat {
                  
                    repeat {
                        print("Choice attacker :"
                            + "\n1. \(currentAttackTeam.tabCharacters[0].name) ( \(currentAttackTeam.tabCharacters[0].roleName)  ) Life: \(currentAttackTeam.tabCharacters[0].life)"
                            + "\n2. \(currentAttackTeam.tabCharacters[1].name) ( \(currentAttackTeam.tabCharacters[1].roleName)  ) Life: \(currentAttackTeam.tabCharacters[1].life)"
                            + "\n3. \(currentAttackTeam.tabCharacters[2].name) ( \(currentAttackTeam.tabCharacters[2].roleName)  ) Life: \(currentAttackTeam.tabCharacters[2].life)")
     
                    data = input()
     
                        } while data != 1 && data != 2 && data != 3
                    
                    choice = true
                    switch data{
                    case 1:
                       if currentAttackTeam.tabCharacters[0].life == 0 {
                            print(" ------------------------------------")
                            print("|CurrentAttack is dead, try aguain |")
                            print(" ------------------------------------")

                            choice = false
                        
                        #warning(": Appel de choiceAttack")
                        }else{
                        currentAttackCharacter = currentAttackTeam.tabCharacters[0]

                            
                        //print("currentAttackCharacter.arme?.degats = \(currentAttackCharacter.arme!.degats)")
                        }
                        
                    case 2:
                        if currentAttackTeam.tabCharacters[1].life == 0 {
                            print(" ------------------------------------")
                            print("|CurrentAttack is dead, try aguain |")
                            print(" ------------------------------------")
                            choice = false
                            
                        }else{
                        currentAttackCharacter = currentAttackTeam.tabCharacters[1]
                        }
                    case 3:
                        if currentAttackTeam.tabCharacters[2].life == 0 {
                            print(" ------------------------------------")
                            print("|CurrentAttack is dead, try aguain |")
                            print(" ------------------------------------")
                                choice = false
                                
                        }else{
                        currentAttackCharacter = currentAttackTeam.tabCharacters[2]
                        }
                    default :
                        choice = false
                        print("error ")
                    
                }
            }while choice == false
        
        
            if currentAttackCharacter.roleName == "Wizard" {
                currentTargetCharacter = healthTeam()
            } else {
                tempCharacter = choiceAttack()
            }
        
        
        
        //is the character himself or one another
        //
        if tempCharacter === currentAttackCharacter {
            return true
        } else {
            currentTargetCharacter = tempCharacter
            return false
        }
        
    } // func choiceFighters()
    
    
    // func which treat his companion
    func healthTeam() -> Character{
        
        
        var nbr: Int
        
        repeat {
            print("Who heal ? :"
                + "\n1. \(currentAttackTeam.tabCharacters[0].name) ( \(currentAttackTeam.tabCharacters[0].roleName)  ) Life: \(currentAttackTeam.tabCharacters[0].life) "
                + "\n2. \(currentAttackTeam.tabCharacters[1].name) ( \(currentAttackTeam.tabCharacters[1].roleName)  ) Life: \(currentAttackTeam.tabCharacters[1].life)"
                + "\n3. \(currentAttackTeam.tabCharacters[2].name) ( \(currentAttackTeam.tabCharacters[2].roleName)  ) Life: \(currentAttackTeam.tabCharacters[2].life)")
            
            nbr  = input()
            
        } while nbr != 1 && nbr != 2 && nbr != 3
        
        
        var choice: Bool = true
        repeat {
            
            switch nbr{
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
                print("error ")
                
            }
        }while choice == false
    }//func healthTeam
    
    
    
    func choiceAttack() -> Character{
        
        var choiceAttackTeam: Bool = true
        var data: Int

    repeat {
        
        repeat{
            print("")
            print("What choice ?")
            print("1. Attaquer")
            print("2. Améliorer son arme")
            print("")
            
            data = input()
            
        }while data != 1 && data != 2

       

    
        switch data{
        case 1:
         
            choiceAttackTeam = true
            return attackOpponent()
       
       case 2:
        
            #warning(": UpdateArme")
            choiceAttackTeam = true
            UpdateArme()
            return currentAttackCharacter
            
            
       
        default :
            choiceAttackTeam = false
            print("error ")
                
        }
        
    }while choiceAttackTeam == false
        
}// func choiceAttack
        

    
    func attackOpponent() -> Character {
        
        let currentTargetTeam =  self.currentTargetTeam
        
        var data: Int
        
        repeat {
        print("Choice of target :"
        + "\n1. \(currentTargetTeam!.tabCharacters[0].name) ( \(currentTargetTeam!.tabCharacters[0].roleName)  ) Life: \(currentTargetTeam!.tabCharacters[0].life) "
        + "\n2. \(currentTargetTeam!.tabCharacters[1].name) ( \(currentTargetTeam!.tabCharacters[1].roleName)  ) Life: \(currentTargetTeam!.tabCharacters[1].life)"
        + "\n3. \(currentTargetTeam!.tabCharacters[2].name) ( \(currentTargetTeam!.tabCharacters[2].roleName)  ) Life: \(currentTargetTeam!.tabCharacters[2].life)")
        
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
        print("error ")
        
        }
        }while choice == false
        
        
    } // func attackOpponent()
 

    func UpdateArme() {
        currentAttackCharacter.arme?.degats *= 2
    }
    
    func theFight() {
        
        //func random which dodges or not the attack
        let esquive: Bool
        let number = Int.random(in: 1 ... 100)
        if number <= 10 {  // 10% de chances
            esquive = true
        }  else {
            esquive = false
        }
        
        print("")
        print("Fights takes place between :")
        print("currentAttackCharacter : \(currentAttackCharacter.name) \(currentAttackCharacter.life)")
        print("currentTargetCharacter : \(currentTargetCharacter.name) \(currentTargetCharacter.life)")
        print("")
        
        
        if currentAttackCharacter.roleName == "Wizard"{

            currentTargetCharacter.life = currentTargetCharacter.life + currentAttackCharacter.arme!.soins

        }else {
            
            let coffre:Bool
            let nbr = Int.random(in: 1 ... 100)
            if nbr <= 5{
                coffre = true
            } else {
                coffre = false
            }
            
            if coffre == true {
                currentAttackCharacter.arme = Legende()  //smellCode ///////////////////
                print(" ---------------------------------------------------------------")
                print("|You opened a safe you won the legendary weapon     |")
                print(" ---------------------------------------------------------------")
                print("|Here is your new weapon  NAME:  \(currentAttackCharacter.arme!.name) DAMAGES : \(currentAttackCharacter.arme!.degats)          |" )
                print(" ---------------------------------------------------------------")
            }

             //currentCharacter.coffre()
            }
        // TESTS DES CAS RANDOM
        // SI ESQUIVE
        if esquive == true {
            print("")
            print("The opponent dodged the attack and counter-attack")
            print("")
            currentAttackCharacter.life = currentAttackCharacter.life - (currentTargetCharacter.arme!.degats)
            
       // else if coffre == true
            
        } else {
            
            // FIGHT NORMAL
            currentTargetCharacter.life = currentTargetCharacter.life - (currentAttackCharacter.arme!.degats)
        }
            
        // MAJ DES VIES SI >100 ou >0
      //  currentCharacter.majMaxLife()
        
        if currentAttackCharacter.life > constants.MAX_LIFE {
            currentAttackCharacter.life = constants.MAX_LIFE
        }
        
        
        if currentTargetCharacter.life > constants.MAX_LIFE {
            currentTargetCharacter.life = constants.MAX_LIFE
        }
        
        if currentAttackCharacter.life < constants.MIN_LIFE {
            currentAttackCharacter.life = constants.MIN_LIFE
        }
        
        if currentTargetCharacter.life < constants.MIN_LIFE {
            currentTargetCharacter.life = constants.MIN_LIFE
        }
       // currentCharacter.majMinLife()

        

        print("the result is  :")
        print("currentAttackCharacter : \(currentAttackCharacter.name) \(currentAttackCharacter.life)")
        print("currentTargetCharacter : \(currentTargetCharacter.name) \(currentTargetCharacter.life)")
        print("")
        
  
    
    } //end of func theFight()
    
    
    func winner() {
    
        if lifeTeam1 == 0 {
            print("The winners is \(team2.name)")
        }
        else{
            print("The winners is \(team1.name)")
        }
    }//end of func winner()

} // end of : Class

