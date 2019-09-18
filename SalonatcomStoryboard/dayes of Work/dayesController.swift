//
//  dayesController.swift
//  SalonatcomStoryboard
//
//  Created by Bassam Ramadan on 9/16/19.
//  Copyright © 2019 Bassam Ramadan. All rights reserved.
//

import UIKit

class dayesController: UIViewController {

    @IBOutlet var startTime : UITextField!
    @IBOutlet var endTime : UITextField!
    private var timePiker : UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        timePiker = UIDatePicker()
        timePiker?.datePickerMode = .time
        timePiker?.addTarget(self, action: #selector(format(timePiker:)), for: .valueChanged)
        
        startTime.inputView = timePiker
        endTime.inputView = timePiker
        
        startTime.delegate = self
        endTime.delegate = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(ok(reg:)))
        view.addGestureRecognizer(tap)
    }
    @objc func format(timePiker : UIDatePicker){
        let time = DateFormatter()
        time.dateFormat = "HH:mm"
        
        if  startTime.isEditing == true{
            startTime.text = time.string(from: timePiker.date)
        }else{
            endTime.text = time.string(from: timePiker.date)
        }
       // view.endEditing(true)
    }
    @objc func ok(reg : UITapGestureRecognizer){
        view.endEditing(true)
    }
}
extension dayesController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
