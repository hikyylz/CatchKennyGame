//
//  GameViewController.swift
//  CatchKennyGame
//
//  Created by Kaan Yıldız on 13.01.2023.
//

import UIKit

class GameViewController: UIViewController {
    
    // variables
    var gameTimer = Timer()
    var kennyTimer = Timer()
    var timeCounter = 30
    var Score = 0
    
    // some texts on screen
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var highScoreLabel: UILabel!
    
    // kenny image views declarations
    @IBOutlet var kenny1: UIImageView!
    @IBOutlet var kenny2: UIImageView!
    @IBOutlet var kenny3: UIImageView!
    @IBOutlet var kenny4: UIImageView!
    @IBOutlet var kenny5: UIImageView!
    @IBOutlet var kenny6: UIImageView!
    @IBOutlet var kenny7: UIImageView!
    @IBOutlet var kenny8: UIImageView!
    @IBOutlet var kenny9: UIImageView!
    
    var kennyArr : [UIImageView] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeLabel.text = "30"
        scoreLabel.text = "Score:\(Score)"
        highScoreLabel.text = "0"
            

        // ekrandaki azalan süreyi ayarlıyorum burda
        gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector( countDown ), userInfo: nil, repeats: true)
        
        kennyTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hiddenKennies), userInfo: nil, repeats: true)
        
        
        
        
        // kenny image leri tıklanabilir kılıyoruz
        prepareKennies()
        
        kennyArr = [kenny1,kenny2,kenny3,kenny4,kenny5,kenny6,kenny7,kenny8,kenny9]
        
    }
    
    
    @objc func countDown(){
        timeCounter -= 1
        timeLabel.text = "\(timeCounter)"
        
        if timeCounter == 0 {
            gameTimer.invalidate()
            kennyTimer.invalidate()
            for kenny in kennyArr {
                kenny.isHidden = true
            }
            
            let Alert = UIAlertController(title: "Time's up", message: "Do you want to continue?", preferredStyle: UIAlertController.Style.alert)
            let continueGame = UIAlertAction(title: "yes", style: UIAlertAction.Style.default) { UIAlertAction in
                // restart game
                self.Score = 0
                self.scoreLabel.text = "Score:\(self.Score)"
                self.timeCounter = 30
                self.timeLabel.text = "30"
                
               
                
                // ekrandaki azalan süreyi ayarlıyorum burda
                self.gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector( self.countDown ), userInfo: nil, repeats: true)
                
                self.kennyTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hiddenKennies), userInfo: nil, repeats: true)
                
            }
            let exitGame = UIAlertAction(title: "no", style: UIAlertAction.Style.destructive) { UIAlertAction in
                UserDefaults.standard.set( self.highScoreLabel.text, forKey: "highScoreKey")
            }
            

            // oluşturduğum alert cinsi objeleri birbirine bağlıyorum
            Alert.addAction(continueGame)
            Alert.addAction(exitGame)
            
            // alert messegae gösterilecek
            self.present(Alert, animated: true)
        }
        
        
        
        
    }
    
    @objc func increaseScore(){
        Score += 1
        scoreLabel.text = "Score:\(Score)"
    }
    
    @objc func hiddenKennies() -> Int {
        for kenny in kennyArr {
            kenny.isHidden = true
        }
        
        let random = Int(arc4random_uniform( UInt32(kennyArr.count) ))
        kennyArr[random].isHidden = false
        return random
    }
    
    
    
    func prepareKennies() {
        kenny1.isUserInteractionEnabled = true
        kenny2.isUserInteractionEnabled = true
        kenny3.isUserInteractionEnabled = true
        kenny4.isUserInteractionEnabled = true
        kenny5.isUserInteractionEnabled = true
        kenny6.isUserInteractionEnabled = true
        kenny7.isUserInteractionEnabled = true
        kenny8.isUserInteractionEnabled = true
        kenny9.isUserInteractionEnabled = true
        
        let kenny1GR = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let kenny2GR = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let kenny3GR = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let kenny4GR = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let kenny5GR = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let kenny6GR = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let kenny7GR = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let kenny8GR = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let kenny9GR = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        kenny1.addGestureRecognizer(kenny1GR)
        kenny2.addGestureRecognizer(kenny2GR)
        kenny3.addGestureRecognizer(kenny3GR)
        kenny4.addGestureRecognizer(kenny4GR)
        kenny5.addGestureRecognizer(kenny5GR)
        kenny6.addGestureRecognizer(kenny6GR)
        kenny7.addGestureRecognizer(kenny7GR)
        kenny8.addGestureRecognizer(kenny8GR)
        kenny9.addGestureRecognizer(kenny9GR)
    }

}
