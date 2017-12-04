//
//  SerieViewController.swift
//  IOS-retest
//
//  Created by Laurence on 04/12/2017.
//  Copyright © 2017 Hetic. All rights reserved.
//

import UIKit

class SerieViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var serieList = [Serie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //Contrats : Quelles sont les données et ce que j'en fais
        tableView.dataSource = self
        tableView.delegate = self
        
        //Ajouter 1 série au tableau
        var newSerie = Serie(withTheTitle: "The Walking Dead", andTheScore: 4.2)
        self.serieList.append(newSerie)
        
        newSerie = Serie(withTheTitle: "Rick and Morty", andTheScore: 5.0)
        self.serieList.append(newSerie)
        
        newSerie = Serie(withTheTitle: "Game of Throne", andTheScore: 4.9)
        self.serieList.append(newSerie)
        
        newSerie = Serie(withTheTitle: "The Wire", andTheScore: 5.0)
        self.serieList.append(newSerie)
        
        newSerie = Serie(withTheTitle: "Breaking Bad", andTheScore: 3.8)
        self.serieList.append(newSerie)
    }

}

//Implémenter le Delegate
extension SerieViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return serieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Retourner une cellule
        
        //récupérer la cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "serieCell")
        
        //transformer en série
        if let serieCell = cell as? SerieTableViewCell{
            //serieCell.leftLabel.text = "Serie title"
            //serieCell.rightLabel.text = "Ma note"
            
            //Récupérer la série
            let serie = self.serieList[indexPath.row]
            
            serieCell.setup(withSerie: serie)
            
            // retourner la cellule qu'on vient de faire
            return serieCell
        }
        // Si je me trompe je renvoie une cellule vide
        return UITableViewCell()
    }
}

//Implémenter un nouveau contrat
extension SerieViewController : UITableViewDelegate {
    //Click
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let serie = self.serieList[indexPath.row]
        
        //Créer la popup
        let alertController = UIAlertController(title: "Tap sur serie",
            message: serie.title, preferredStyle: .alert)
        
        //Cancel pour pouvoir fermer
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true)
    }
}
