//
//  HelpController.swift
//  BlackJack
//
//  Created by Joe on 3/12/17.
//  Copyright © 2017 Jake Dremann. All rights reserved.
//

import Foundation
import UIKit

class HelpController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
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
    
    @IBAction func HideKeyboard(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    
    @IBAction func SendPressed(_ sender: UIButton) {
        if(emailTextField.text == ""){
            let title = "Please enter text in the text field."
            let alertController = UIAlertController(title: title, message: "", preferredStyle: .alert)
            
            let OkAction = UIAlertAction(title: "ok", style: .default) { action in
                self.viewWillAppear(true)
            }
            alertController.addAction(OkAction)
            self.present(alertController, animated: true, completion: nil)
        }
        else{
        
        let title = "Message Sent!"
        let alertController = UIAlertController(title: title, message: "", preferredStyle: .alert)

        let OkAction = UIAlertAction(title: "ok", style: .default) { action in
            self.viewWillAppear(true)
        }
        alertController.addAction(OkAction)
        self.present(alertController, animated: true, completion: nil)
        emailTextField.text = ""
        }
        
    }
}
    
    
    

    

