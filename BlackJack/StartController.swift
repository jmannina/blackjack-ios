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
var totalCash = 500
var bet = 0
var tempIndex = 0

class StartController: UIViewController {
    @IBOutlet weak var lblCardOne: UILabel!
    @IBOutlet weak var lblCardTwo: UILabel!
    @IBOutlet weak var lblCardTotal: UILabel!
    @IBOutlet weak var lblCardThree: UILabel!
    @IBOutlet weak var lblCardFive: UILabel!
    @IBOutlet weak var lblCardSix: UILabel!
    @IBOutlet weak var lblCardFour: UILabel!
    
    @IBOutlet weak var btnHit: UIButton!
    @IBOutlet weak var btnStay: UIButton!
    @IBOutlet weak var btnLock: UIButton!
    
    @IBOutlet weak var DealerCardOne: UILabel!
    @IBOutlet weak var DealerCardTwo: UILabel!
    @IBOutlet weak var DealerCardThree: UILabel!
    @IBOutlet weak var DealerCardFour: UILabel!
    @IBOutlet weak var DealerCardFive: UILabel!
    @IBOutlet weak var DealerCardSix: UILabel!
    @IBOutlet weak var DealerTotal: UILabel!
    
    @IBOutlet weak var lblTotalWord: UILabel!
    @IBOutlet weak var lblTotalWordPlayer: UILabel!
    
    @IBOutlet weak var lblBet: UILabel!
    @IBOutlet weak var lblTotalCash: UILabel!
    @IBOutlet weak var betSlider: UISlider!
    
    @IBAction func betSliderChange(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        lblBet.text = "\(currentValue)"
        bet = Int(sender.value)
        
    }
    
    var shuffle = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: Deck) as! [Card]
    
    //will return the next card when the user chooses to "Hit"
    func nextCard(cardList: [Card]) -> Card{
        return cardList[currentCardIndex + 1]
    }
    
    override func viewWillAppear(_ animated: Bool){
        
        tempIndex = 0
        
        var shuffle2 = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: shuffle) as! [Card]
        
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
        btnHit.isEnabled = false
        btnStay.isEnabled = false
        DealerCardOne.isHidden = true
        DealerCardTwo.isHidden = true
        lblCardOne.isHidden = true
        lblCardTwo.isHidden = true
        lblCardThree.isHidden = true
        lblCardFour.isHidden = true
        lblCardFive.isHidden = true
        lblCardSix.isHidden = true
        DealerCardThree.isHidden = true
        DealerCardFour.isHidden = true
        DealerCardFive.isHidden = true
        DealerCardSix.isHidden = true
        DealerTotal.isHidden = true
        lblCardTotal.isHidden = true

        lblCardOne.text = shuffle2[0].cardName
        lblCardTwo.text = shuffle2[1].cardName
        lblCardTotal.text = String(shuffle2[0].value + shuffle2[1].value)
        DealerCardOne.text = shuffle2[2].cardName
        DealerCardTwo.text = shuffle2[3].cardName
        DealerTotal.text = String(shuffle2[2].value
         + shuffle2[3].value)
        
        currentCardIndex = 3
        currentNumberOfCards = 4
    }
    
    
    @IBAction func LockInBet(_ sender: UIButton) {
        DealerCardOne.isHidden = false
        lblCardOne.isHidden = false
        lblCardTwo.isHidden = false
        betSlider.isHidden = true
        btnHit.isEnabled = true
        btnStay.isEnabled = true
        lblCardTotal.isHidden = false
        btnLock.isHidden = true
        lblCardTotal.isHidden = false
    }
    
    internal func reset() {
        DealerCardOne.isHidden = true
        lblCardOne.isHidden = true
        lblCardTwo.isHidden = true
        betSlider.isHidden = false
        lblCardOne.isHidden = true
        lblCardTwo.isHidden = true
        btnHit.isEnabled = false
        btnStay.isEnabled = false
        lblCardTotal.isHidden = true
        btnLock.isHidden = false
        lblCardTotal.isHidden = true
    }
    
    @IBAction func HitPressed(_ sender: UIButton) {
        
        let shuffle2 = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: shuffle) as! [Card]
        
        let currentCard = nextCard(cardList: shuffle2)
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
        
        let shuffle2 = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: shuffle) as! [Card]
        
        let currentCard = nextCard(cardList: shuffle2)
        
        if(Int(DealerTotal.text!)! < 17){
    
            dealerCardlist[tempIndex]!.isHidden = false
            dealerCardlist[tempIndex]!.text = currentCard.cardName
            DealerTotal.text = String((Int(DealerTotal.text!)! + currentCard.value))
            currentCardIndex = currentCardIndex + 1
            dealerCardCount = dealerCardCount + 1
            tempIndex = tempIndex + 1
        
            DealerHit(currentValue: (Int(DealerTotal.text!)!))
        }else{
            if(Int(DealerTotal.text!)! > 21){
                youWin()
            }else{
                if (Int(DealerTotal.text!)! == Int(lblCardTotal.text!)!){
                    youTied()
                } else if (Int(DealerTotal.text!)! > Int(lblCardTotal.text!)!){
                    youLose()
                }else{
                    youWin()
                }
            }
        }

    }

    
    @IBAction func StayPressed(_ sender: UIButton) {
        DealerTotal.isHidden = false
        DealerCardTwo.isHidden = false
        let dealerTotal: Int = Int(DealerTotal.text!)!
        let playerTotal: Int = Int(lblCardTotal.text!)!
        if(dealerTotal > playerTotal){
            youLose()
        } else if (dealerTotal >= 17) {
            if(playerTotal > dealerTotal){
                youWin()
            } else if (playerTotal == dealerTotal){
                youTied()
            } else {
                youLose()
            }
        } else {
            DealerHit(currentValue: dealerTotal)
        }
    }
    
    override func viewDidLoad() {
        totalCash = 500
        lblTotalCash.text = "\(totalCash)"
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func BackButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "menuSegue", sender: totalCash)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? MainMenuController {
            if let score = sender as? Int {
                dest.highscore = score
            }
        }
    }
    
    
    internal func youWin(){
        totalCash = totalCash + bet
        lblTotalCash.text = "\(totalCash)"
        betSlider.maximumValue = Float(totalCash)
        
        let title = "You Won!"
        let alertController = UIAlertController(title: title, message: "", preferredStyle: .alert)

        let PlayAgainAction = UIAlertAction(title: "Play Again", style: .default) { action in
            self.viewWillAppear(true)
            self.reset()
        }
            
            
        let MainMenuAction = UIAlertAction(title: "Main Menu", style: .default) { action in
            self.performSegue(withIdentifier: "menuSegue", sender: totalCash)
            }
            
        alertController.addAction(PlayAgainAction)
        alertController.addAction(MainMenuAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    internal func youLose(){
        let Atitle = "You Lost!"
        var Ptitle = "Play Again"
        
        totalCash = totalCash - bet
        
        if (totalCash <= 0) {
            Ptitle = "Start Over"
            totalCash = 500
            lblTotalCash.text = "\(totalCash)"
            betSlider.maximumValue = Float(totalCash)
        }else{
            lblTotalCash.text = "\(totalCash)"
            betSlider.maximumValue = Float(totalCash)
        }
        
        let alertController = UIAlertController(title: Atitle, message: "", preferredStyle: .alert)
        
        let PlayAgainAction = UIAlertAction(title: Ptitle, style: .default) { action in
            self.viewWillAppear(true)
            self.reset()
        }
        
        
        let MainMenuAction = UIAlertAction(title: "Main Menu", style: .default) { action in
            self.performSegue(withIdentifier: "menuSegue", sender: totalCash)
        }
        
        alertController.addAction(PlayAgainAction)
        alertController.addAction(MainMenuAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    internal func youTied(){
        let title = "You Tied!"
        
        let alertController = UIAlertController(title: title, message: "", preferredStyle: .alert)
        
        let PlayAgainAction = UIAlertAction(title: "Play Again", style: .default) { action in
            self.viewWillAppear(true)
            self.reset()
        }
        
        
        let MainMenuAction = UIAlertAction(title: "Main Menu", style: .default) { action in
            self.performSegue(withIdentifier: "menuSegue", sender: totalCash)
        }
        
        alertController.addAction(PlayAgainAction)
        alertController.addAction(MainMenuAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
