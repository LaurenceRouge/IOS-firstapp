//
//  ModalViewController.swift
//  IOS-retest
//
//  Created by Laurence on 27/11/2017.
//  Copyright © 2017 Hetic. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {

    @IBOutlet weak var CloseButton: UIButton!
    
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
        self.dismiss(animated: true){
            print("C'est OK")
        }
    }
    
}
