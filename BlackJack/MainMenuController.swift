//
//  MainMenuController.swift
//  BlackJack
//
//  Created by Joe on 3/12/17.
//  Copyright © 2017 Jake Dremann. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit


class MainMenuController: UIViewController {
    
    struct GlobalVariables {
        static var scores : [Int] = []
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        GlobalVariables.scores.append(_highscore)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private var _highscore = Int()
    
    var highscore : Int {
        get {
            return _highscore
        } set {
            _highscore = newValue
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? ScoresController {
            if let scorex = sender as? [Int] {
                dest.highscores = scorex
            }
        }
    }

    
    @IBAction func startPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "startSegue", sender: Any?.self)
    }
    
    @IBAction func scoresPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "scoresSegue", sender: GlobalVariables.scores)
    }
    
}
