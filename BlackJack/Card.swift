//
//  Deck.swift
//  BlackJack
//
//  Created by Joe on 3/12/17.
//  Copyright © 2017 Jake Dremann. All rights reserved.
//

import Foundation
import SpriteKit



class Card{
    let cardName: String
    let value: Int
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    init(cardname:String, value:Int) {
        self.cardName = cardname
        self.value = value
    }
}


//currently have it set as a global variable.
var Deck =
[
    Card(cardname: "2♠️", value: 2),
    Card(cardname: "3♠️", value: 3),
    Card(cardname: "4♠️", value: 4),
    Card(cardname: "5♠️", value: 5),
    Card(cardname: "6♠️", value: 6),
    Card(cardname: "7♠️", value: 7),
    Card(cardname: "8♠️", value: 8),
    Card(cardname: "9♠️", value: 9),
    Card(cardname: "10♠️", value: 10),
    Card(cardname: "J♠️", value: 10),
    Card(cardname: "Q♠️", value: 10),
    Card(cardname: "K♠️", value: 10),
    Card(cardname: "A♠️", value: 1),
    
    Card(cardname: "2♣️", value: 2),
    Card(cardname: "3♣️", value: 3),
    Card(cardname: "4♣️", value: 4),
    Card(cardname: "5♣️", value: 5),
    Card(cardname: "6♣️", value: 6),
    Card(cardname: "7♣️", value: 7),
    Card(cardname: "8♣️", value: 8),
    Card(cardname: "9♣️", value: 9),
    Card(cardname: "10♣️", value: 10),
    Card(cardname: "J♣️", value: 10),
    Card(cardname: "Q♣️", value: 10),
    Card(cardname: "K♣️", value: 10),
    Card(cardname: "A♣️", value: 1),
    
    Card(cardname: "2♦️", value: 2),
    Card(cardname: "3♦️", value: 3),
    Card(cardname: "4♦️", value: 4),
    Card(cardname: "5♦️", value: 5),
    Card(cardname: "6♦️", value: 6),
    Card(cardname: "7♦️", value: 7),
    Card(cardname: "8♦️", value: 8),
    Card(cardname: "9♦️", value: 9),
    Card(cardname: "10♦️", value: 10),
    Card(cardname: "J♦️", value: 10),
    Card(cardname: "Q♦️", value: 10),
    Card(cardname: "K♦️", value: 10),
    Card(cardname: "A♦️", value: 1),
    
    Card(cardname: "2❤️", value: 2),
    Card(cardname: "3❤️", value: 3),
    Card(cardname: "4❤️", value: 4),
    Card(cardname: "5❤️", value: 5),
    Card(cardname: "6❤️", value: 6),
    Card(cardname: "7❤️", value: 7),
    Card(cardname: "8❤️", value: 8),
    Card(cardname: "9❤️", value: 9),
    Card(cardname: "10❤️", value: 10),
    Card(cardname: "J❤️", value: 10),
    Card(cardname: "Q❤️", value: 10),
    Card(cardname: "K❤️", value: 10),
    Card(cardname: "A❤️", value: 1),
    
]
