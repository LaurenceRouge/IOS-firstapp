//
//  SecondViewController.swift
//  IOS-retest
//
//  Created by Laurence on 27/11/2017.
//  Copyright © 2017 Hetic. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    // A revoir
    var message = ""
    @IBOutlet weak var monMessageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        monMessageLabel.text = message
    }

}
