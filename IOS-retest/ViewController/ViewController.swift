//
//  ViewController.swift
//  IOS-retest
//
//  Created by Laurence on 27/11/2017.
//  Copyright © 2017 Hetic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //Appeler à chaque action, changement de page définir que c'est ce controller qui va écouter le message
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "modal" {
            let destination = segue.destination
            if let modalControler = destination as?
                ModalViewController {
                modalControler.delegate = self
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//Ajouter la fonctionnalité à mon ViewController
extension ViewController: ModalViewControllerDelegate{
    func shoulCloseMyself(modal: ModalViewController) {
        //Auto-destruction de ModalViewController
        modal.dismiss(animated: true){
            print("C'est OK")
        }
    }
}

