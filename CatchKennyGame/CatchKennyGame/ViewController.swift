//
//  ViewController.swift
//  CatchKennyGame
//
//  Created by Kaan Yıldız on 13.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func StartClicked(_ sender: Any) {
        performSegue(withIdentifier: "StartSeque", sender: self)
    }
    
    @IBAction func GameInfoClicked(_ sender: Any) {
        performSegue(withIdentifier: "GameInfoSeque", sender: self)
    }
}

