//
//  StartController.swift
//  BlackJack
//
//  Created by Joe on 3/12/17.
//  Copyright © 2017 Jake Dremann. All rights reserved.
//

import Foundation
import UIKit
import GameplayKit



class StartController: UIViewController {
    @IBOutlet weak var lblCardOne: UILabel!
    @IBOutlet weak var lblCardTwo: UILabel!
    @IBOutlet weak var lblCardTotal: UILabel!
   
    
    var shuffle = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: Deck) as! [Card]
    
    override func viewWillAppear(_ animated: Bool){
        lblCardOne.text = shuffle[0].cardName
        lblCardTwo.text = shuffle[1].cardName
        lblCardTotal.text = String(shuffle[0].value + shuffle[1].value)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func BackButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
