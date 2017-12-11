//
//  Serie.swif.swift
//  IOS-retest
//
//  Created by Laurence on 04/12/2017.
//  Copyright © 2017 Hetic. All rights reserved.
//

import Foundation

class Serie {
    //Valeur doit être obligatoire
    let title: String
    var score: Float
    
    //Constructeur qui assigne les valeurs
    init(withTheTitle newtitle: String, andTheScore newscore: Float) {
        self.title = newtitle
        self.score = newscore
    }
    
}


