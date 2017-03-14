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

var BgColor = UIColor.lightGray
var CardColor = UIColor.black


class StartController: UIViewController {
    @IBOutlet weak var lblCardOne: UILabel!
    @IBOutlet weak var lblCardTwo: UILabel!
    @IBOutlet weak var lblCardTotal: UILabel!
    @IBOutlet weak var lblCardThree: UILabel!
    @IBOutlet weak var lblCardFive: UILabel!
    @IBOutlet weak var lblCardSix: UILabel!
    @IBOutlet weak var lblCardFour: UILabel!
    
    @IBOutlet weak var DealerCardOne: UILabel!
    @IBOutlet weak var DealerCardTwo: UILabel!
    @IBOutlet weak var DealerCardThree: UILabel!
    @IBOutlet weak var DealerCardFour: UILabel!
    @IBOutlet weak var DealerCardFive: UILabel!
    @IBOutlet weak var DealerCardSix: UILabel!
    @IBOutlet weak var DealerTotal: UILabel!
    
    @IBOutlet weak var lblTotalWord: UILabel!
    @IBOutlet weak var lblTotalWordPlayer: UILabel!
    
    var shuffle = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: Deck) as! [Card]
    
    //will return the next card when the user chooses to "Hit"
    func nextCard() -> Card{
        
        return shuffle[currentCardIndex + 1]
    }
    
    override func viewWillAppear(_ animated: Bool){
        
        //setting the background and text colors for the labels/view. Deafult it bg: Light grey, Text: Black
        self.view.backgroundColor = BgColor
        lblCardOne.textColor = CardColor
        lblCardTwo.textColor = CardColor
        lblCardThree.textColor = CardColor
        lblCardFour.textColor = CardColor
        DealerCardOne.textColor = CardColor
        DealerCardTwo.textColor = CardColor
        lblTotalWord.textColor = CardColor
        lblTotalWordPlayer.textColor = CardColor
        lblCardTotal.textColor = CardColor
        DealerTotal.textColor = CardColor
        
        
        //this will hide the extra labels for cards that not have been drawn
        lblCardThree.isHidden = !lblCardThree.isHidden
        lblCardFour.isHidden = !lblCardFour.isHidden
        lblCardFive.isHidden = !lblCardFive.isHidden
        lblCardSix.isHidden = !lblCardSix.isHidden
        DealerCardThree.isHidden = !DealerCardThree.isHidden
        DealerCardFour.isHidden = !DealerCardFour.isHidden
        DealerCardFive.isHidden = !DealerCardFive.isHidden
        DealerCardSix.isHidden = !DealerCardSix.isHidden


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
            lblCardThree.isHidden = !lblCardThree.isHidden
            lblCardThree.text = currentCard.cardName
            lblCardTotal.text = String((Int(lblCardTotal.text!)! + currentCard.value))
            currentCardIndex = 4
            currentNumberOfCards = 5
        }
        else if (currentNumberOfCards == 5){
            lblCardFour.isHidden = !lblCardFour.isHidden
            lblCardFour.text = currentCard.cardName
            lblCardTotal.text = String((Int(lblCardTotal.text!)! + currentCard.value))
            currentCardIndex = 5
            currentNumberOfCards = 6
        }
        else if (currentNumberOfCards == 6){
            lblCardFive.isHidden = !lblCardFive.isHidden
            lblCardFive.text = currentCard.cardName
            lblCardTotal.text = String((Int(lblCardTotal.text!)! + currentCard.value))
            currentCardIndex = 6
            currentNumberOfCards = 7
        }
        else if (currentNumberOfCards == 7){
            lblCardSix.isHidden = !lblCardSix.isHidden
            lblCardSix.text = currentCard.cardName
            lblCardTotal.text = String((Int(lblCardTotal.text!)! + currentCard.value))
            currentCardIndex = 7
            currentNumberOfCards = 8
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
