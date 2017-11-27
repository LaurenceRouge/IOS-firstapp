//
//  ModalViewController.swift
//  IOS-retest
//
//  Created by Laurence on 27/11/2017.
//  Copyright © 2017 Hetic. All rights reserved.
//

import UIKit

//Créer le protocol : Delegate close to ViewController
protocol ModalViewControllerDelegate {
    func shoulCloseMyself(modal: ModalViewController)
    
    
}
class ModalViewController: UIViewController {

    @IBOutlet weak var CloseButton: UIButton!
    
    //Apple va créer le delegate vide par défaut
    var delegate: ModalViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        CloseButton.setTitleColor(UIColor.green, for: .normal)
        CloseButton.setTitleColor(UIColor.blue, for: .highlighted)
        CloseButton.setTitle("Fermer", for: .normal)
        CloseButton.setTitle("Appuyer", for: .highlighted)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func didTapOnClose(_ sender: Any) {
        print("Close")
        
        if let monDelegate = delegate {
            monDelegate.shoulCloseMyself(modal: self)
        }
        
        //Auto-destruction de ModalViewController
//        self.dismiss(animated: true){
//            print("C'est OK")
//        }
    }
    
}
