//
//  GrantedViewController.swift
//  IOS-retest
//
//  Created by Laurence on 27/11/2017.
//  Copyright © 2017 Hetic. All rights reserved.
//

import UIKit

class GrantedViewController: UIViewController {

    @IBOutlet weak var grantedLabel: UILabel!
    var email = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        grantedLabel.text = "Bravo \(email) !!!"
    }


}
