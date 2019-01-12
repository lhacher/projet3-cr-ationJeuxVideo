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
        super.init(name: "",degats: constants.DEGATS )
    }
}

class Sceptre: Arme {
    init() {
        super.init(name: "Sceptre", degats: 50)
    }
}

class Bouclier: Arme {
    init() {
        super.init(name: "", degats: 50)
    }
}

class Hache: Arme {
    init() {
        super.init(name: "", degats: 50)
    }
}
