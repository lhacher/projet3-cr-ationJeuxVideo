//
//  Epee.swift
//  WarGame
//
//  Created by Lucas HACHER on 09/10/2018.
//  Copyright © 2018 Lucas HACHER. All rights reserved.
//

import Foundation


class Epees: Arme {
    init() {
        super.init(name: "Epee",degats: constants.DEGATS, soins: constants.SOINS)
    }
}

class Sceptre: Arme {
    init() {
        super.init(name: "Sceptre", degats: constants.DEGAT, soins: constants.SOIN)
    }
}

class Bouclier: Arme {
    init() {
        super.init(name: "Bouclier", degats: constants.DEGATS, soins: constants.SOINS)
    }
}

class Hache: Arme {
    init() {
        super.init(name: "Hache", degats: constants.DEGATS, soins: constants.SOINS)
    }
}

class Legende: Arme {
    init() {
        super.init(name: "Excalibur", degats: constants.LEGENDE, soins: constants.SOINS)
    }
}
