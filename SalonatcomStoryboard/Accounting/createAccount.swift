//
//  createAccount.swift
//  SalonatcomStoryboard
//
//  Created by Bassam Ramadan on 9/14/19.
//  Copyright © 2019 Bassam Ramadan. All rights reserved.
//

import UIKit

class createAccount: UIViewController {

     @IBOutlet var nameTextField : UITextField!
     @IBOutlet var phoneTextField : UITextField!
     @IBOutlet var passTextField : UITextField!
     @IBOutlet var checkPassTextField : UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        phoneTextField.delegate = self
        passTextField.delegate = self
        checkPassTextField.delegate = self
    }
    

}
extension createAccount : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
