//
//  theControllers.swift
//  SalonatcomStoryboard
//
//  Created by Bassam Ramadan on 9/15/19.
//  Copyright © 2019 Bassam Ramadan. All rights reserved.
//

import UIKit

class theControllers: UIViewController {

    @IBOutlet var name : UITextField!
    @IBOutlet var phone : UITextField!
    @IBOutlet var subject : UITextField!
    @IBOutlet var body : UITextView!
    @IBOutlet var send : UIButton!
    @IBAction func SendSuggestion(_ sender: Any?) {
        name.text = ""
        phone.text = ""
        subject.text = ""
        body.text = ""
    }
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.delegate = self
        phone.delegate = self
        subject.delegate = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(ok(reg:)))
        view.addGestureRecognizer(tap)
    }
    @objc func ok(reg : UITapGestureRecognizer){
        view.endEditing(true)
    }

}
extension theControllers : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

