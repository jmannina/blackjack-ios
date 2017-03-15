//
//  ScoresController.swift
//  BlackJack
//
//  Created by Jake Dremann on 3/14/17.
//  Copyright © 2017 Jake Dremann. All rights reserved.
//

import UIKit

class ScoresController: UIViewController {

    @IBOutlet weak var scores: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populate()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private var _highscores : [Int] = []
    
    var highscores : [Int] = []

    @IBAction func backPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    internal func populate() {
        highscores.sort{
            return $1 < $0
        }
        scores.text = ""
        scores.sizeToFit()
        for i in 0...(highscores.count-1) {
            scores.text = scores.text! + "\(i + 1)"
            scores.text = scores.text! + ".  " + String(highscores[i]) + "\n"
        }
        scores.sizeToFit()
    }
}
