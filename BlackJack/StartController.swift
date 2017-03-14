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
var dealerCardCount = 2

var BgColor = UIColor.lightGray
var CardColor = UIColor.black

var tempIndex = 0

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
        
        var shuffle = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: Deck) as! [Card]
        
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
        DealerCardThree.textColor = CardColor
        DealerCardFour.textColor = CardColor
        DealerCardFive.textColor = CardColor
        DealerCardThree.textColor = CardColor
        
        
        //this will hide the extra labels for cards that not have been drawn
        lblCardThree.isHidden = true
        lblCardFour.isHidden = true
        lblCardFive.isHidden = true
        lblCardSix.isHidden = true
        DealerCardThree.isHidden = true
        DealerCardFour.isHidden = true
        DealerCardFive.isHidden = true
        DealerCardSix.isHidden = true


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
        
        if((Int(lblCardTotal.text!)! > 21)){
            youLose()
        }
    }
    
    func DealerHit(currentValue: Int){
        
        let dealerCardlist = [DealerCardThree, DealerCardFour, DealerCardFive, DealerCardSix]
        
        let currentCard = nextCard()
        
        if(Int(DealerTotal.text!)! < 17){
    
            dealerCardlist[tempIndex]!.isHidden = false
            dealerCardlist[tempIndex]!.text = currentCard.cardName
            DealerTotal.text = String((Int(DealerTotal.text!)! + currentCard.value))
            currentCardIndex = currentCardIndex + 1
            dealerCardCount = dealerCardCount + 1
            tempIndex = tempIndex + 1
        
            DealerHit(currentValue: (Int(DealerTotal.text!)!))
        }

        if(Int(DealerTotal.text!)! > 21){
            youWin()
        }
        
        if(Int(DealerTotal.text!)! < 21){
            if((Int(DealerTotal.text!)!) > Int(lblCardTotal.text!)!){
                youLose()
            }
            else if((Int(DealerTotal.text!)!) < Int(lblCardTotal.text!)!){
                youWin()
            }
            else if((Int(DealerTotal.text!)!) == Int(lblCardTotal.text!)!){
                youLose()
            }
            else{
                youLose()
            }
        }

    }

    
    @IBAction func StayPressed(_ sender: UIButton) {
        let dealerTotal: Int = Int(DealerTotal.text!)!
        let playerTotal: Int = Int(lblCardTotal.text!)!
        if(dealerTotal > playerTotal){
            youLose()
        }
        else if(dealerTotal == playerTotal){
            youLose()
        }
        if(dealerTotal >= 17){
            if(playerTotal > dealerTotal){
                youWin()
            }
            else{
                youLose()
            }
        }
        else if(dealerTotal < 17){
            DealerHit(currentValue: dealerTotal)
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
    
    
    internal func youWin(){
        let title = "You Won!"
        let alertController = UIAlertController(title: title, message: "", preferredStyle: .alert)

        let PlayAgainAction = UIAlertAction(title: "Play Again", style: .default) { action in
            self.viewWillAppear(true)
        }
            
            
        let MainMenuAction = UIAlertAction(title: "Main Menu", style: .default) { action in
                self.dismiss(animated: true, completion: nil)
            }
            
            alertController.addAction(PlayAgainAction)
            alertController.addAction(MainMenuAction)
            self.present(alertController, animated: true, completion: nil)
    }
    
    internal func youLose(){
        let title = "You Lost!"
        let alertController = UIAlertController(title: title, message: "", preferredStyle: .alert)
        
        let PlayAgainAction = UIAlertAction(title: "Play Again", style: .default) { action in
            self.viewWillAppear(true)
        }
        
        
        let MainMenuAction = UIAlertAction(title: "Main Menu", style: .default) { action in
            self.dismiss(animated: true, completion: nil)
        }
        
        alertController.addAction(PlayAgainAction)
        alertController.addAction(MainMenuAction)
        self.present(alertController, animated: true, completion: nil)
    }

    
}
