//
//  OptionsController.swift
//  BlackJack
//
//  Created by Joe on 3/12/17.
//  Copyright © 2017 Jake Dremann. All rights reserved.
//

import Foundation
import UIKit

class OptionController: UIViewController {
    
    @IBOutlet weak var BgColorSegmentController: UISegmentedControl!
    
    @IBOutlet weak var CardColorSegmentController: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func BackButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func SaveButtonPressed(_ sender: UIButton) {
        
        let tempBgColor = BgColorSegmentController.titleForSegment(at: BgColorSegmentController.selectedSegmentIndex)!
        
        let tempCardColor = CardColorSegmentController.titleForSegment(at: CardColorSegmentController.selectedSegmentIndex)!
        
        if(tempBgColor == "Grey"){
            BgColor = UIColor.lightGray
        }
        else if(tempBgColor == "Blue"){
            BgColor = UIColor.blue
        }
        else if(tempBgColor == "Red"){
            BgColor = UIColor.red
        }
        else if(tempBgColor == "Green"){
            BgColor = UIColor.green
        }
        else if(tempBgColor == "Green"){
            BgColor = UIColor.green
        }
        if(tempCardColor == "Black"){
            CardColor = UIColor.black
        }
        if(tempCardColor == "Red"){
            CardColor = UIColor.red
        }
        else if(tempCardColor == "White"){
            CardColor = UIColor.white
        }
        else if(tempCardColor == "Green"){
            CardColor = UIColor.green
        }
    }
}
