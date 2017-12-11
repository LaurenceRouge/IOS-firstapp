//
//  DatabaseGrosPate.swift
//  IOS-retest
//
//  Created by Laurence on 11/12/2017.
//  Copyright © 2017 Hetic. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DatabaseGrosPate {
    
    func addInDatabase(){
        
        let appDelegate = UIApplication.shared as! AppDelegate
        let persistentContainer = appDelegate.persistentContainer!
        let databaseContext = persistentContainer.viewContext
        
        //L'étudiant connaît la base de données
        let etudiant = Etudiant(context: databaseContext)
        etudiant.name = "Laurence"
        etudiant.dateNaissance = Date()
        
        
        do {
            var monCodeAvant = 0
            
            //Faire la sauvegarde
            try databaseContext.save()
            
            monCodeAvant += 1
        } catch let error {
            print("\(error)")
        }
    }
    
    func getObjectInDatabase() {
        let appDelegate = UIApplication.shared as! AppDelegate
        let persistentContainer = appDelegate.persistentContainer!
        let databaseContext = persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Cours")
        
        request.predicate = NSPredicate(format: "niveau > 3") //Filtre de ma request
        
        let sortDescriptor = NSSortDescriptor(key: "nom", ascending: true) // Tri
        request.sortDescriptors = [sortDescriptor] //Associe le tri avec la request
        
        do {
            
            let coursList = try? databaseContext.fetch(request)
            print("\(coursList?.count)")
            
        }
    
    }
    
    func deleteObjectInDatabase() { // Pas de multiple supression en 1 fois
        let appDelegate = UIApplication.shared as! AppDelegate
        let persistentContainer = appDelegate.persistentContainer!
        let databaseContext = persistentContainer.viewContext
        
        //Récupérer les valeurs
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Cours")
        request.predicate = NSPredicate(format: "niveau <= 2") //Filtre de ma request
        
        
        do {
            let coursListMayBeNull = try? databaseContext.fetch(request)
            
            if let coursList = coursListMayBeNull as? [Cours] {
                //Vérifier que les cours sont bien présents
                // Faire un delete sur chaque cours
                for cours in coursList {
                    
                    databaseContext.delete(cours)
                }
                
                //Sauvegarder le BDD
                try? databaseContext.save()
                
            } else {
                print("Il n'y a pas de cours")
            }
        }
    }
    
    func updateObjectInDatabase() {
        let appDelegate = UIApplication.shared as! AppDelegate
        let persistentContainer = appDelegate.persistentContainer!
        let databaseContext = persistentContainer.viewContext
        
        //Récupérer les valeurs
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Cours")
        request.predicate = NSPredicate(format: "nom == %@", "Kickstarting-IOS") //Filtre de ma request avec une injection de valeur
        
        do {
            let coursListMayBeNil = try? databaseContext.fetch(request)
            
            if let coursList = coursListMayBeNil as? [Cours] {
                //Vérifier que les cours sont bien présents
                
                let monPremierCours = coursList[0]
                monPremierCours.niveau = 5
                
                //Sauvegarder le BDD
                try? databaseContext.save()
                
            } else {
                print("Il n'y a pas de cours")
            }
        }
        
    }
    
    func exempleDutilisationDeThread(){
        DispatchQueue.global().async {
            let appDelegate = UIApplication.shared as! AppDelegate
            let persistentContainer = appDelegate.persistentContainer!
            let databaseContext = persistentContainer.viewContext
            
            //L'étudiant connaît la base de données
            let etudiant = Etudiant(context: databaseContext)
            etudiant.name = "Laurence"
            etudiant.dateNaissance = Date()
            
            
            do {
                var monCodeAvant = 0
                
                //Faire la sauvegarde
                try databaseContext.save()
                
                monCodeAvant += 1
            } catch let error {
                print("\(error)")
            }
            
            DispatchQueue.main.async {
                let button = UIButton()
                button.isEnabled = true
            }
        }
    }
    
}
