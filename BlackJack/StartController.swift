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

var currentCardIndex = Int()
var currentNumberOfCards = Int()



class StartController: UIViewController {
    @IBOutlet weak var lblCardOne: UILabel!
    @IBOutlet weak var lblCardTwo: UILabel!
    @IBOutlet weak var lblCardTotal: UILabel!
    @IBOutlet weak var lblCardThree: UILabel!
    @IBOutlet weak var lblCardFour: UILabel!
    @IBOutlet weak var DealerCardOne: UILabel!
    @IBOutlet weak var DealerCardTwo: UILabel!
    @IBOutlet weak var DealerTotal: UILabel!
    
    var shuffle = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: Deck) as! [Card]
    
    //will return the next card when the user chooses to "Hit"
    func nextCard() -> Card{
        
        return shuffle[currentCardIndex + 1]
    }
    
    override func viewWillAppear(_ animated: Bool){
        lblCardOne.text = shuffle[0].cardName
        lblCardTwo.text = shuffle[1].cardName
        lblCardTotal.text = String(shuffle[0].value + shuffle[1].value)
        DealerCardOne.text = shuffle[2].cardName
        DealerCardTwo.text = shuffle[3].cardName
        DealerTotal.text = String(shuffle[2].value
         + shuffle[3].value)
        
        currentCardIndex = 3
        currentNumberOfCards = 4
        
    }
    
    @IBAction func HitPressed(_ sender: UIButton) {
        let currentCard = nextCard()
        if (currentNumberOfCards == 4){
            
            lblCardThree.isEnabled = true
            lblCardThree.text = currentCard.cardName
            lblCardTotal.text = String((Int(lblCardTotal.text!)! + currentCard.value))
            currentCardIndex = 4
            currentNumberOfCards = 5
        }
        else if (currentNumberOfCards == 5){
            lblCardFour.text = currentCard.cardName
            lblCardTotal.text = String((Int(lblCardTotal.text!)! + currentCard.value))
            currentCardIndex = 5
            currentNumberOfCards = 6
        }
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
