//
//  ViewController.swift
//  checkTheLongestPalindrome
//
//  Created by KirRealDev on 07.06.2021.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var strField: UITextField!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var informLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        strField.returnKeyType = .done
        strField.delegate = self

        // Do any additional setup after loading the view.
    }
    
    @IBAction func checkButtonTapped(_ sender: Any) {
        strField.resignFirstResponder()
        let text: String = strField.text ?? " "
        
        if (Palindrome.checkTheLongest(inputStr: text) != "The string is empty") {
            informLabel.text = Palindrome.checkTheLongest(inputStr: text) + " is the longest palindrome in the string"
        }
        else {
            informLabel.text = "There is no palindrome in the string"
        }
        
    }


}

