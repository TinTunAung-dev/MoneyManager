//
//  SelectDateViewController.swift
//  ABank
//
//  Created by Zin Lin Htet Naing on 9/18/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import UIKit

class SelectDateViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var selectButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!

    var delegate: SelectDateDelegate?

    var limitationDate: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDatePicker()
        hideDatePicker()
    }


    private func configureDatePicker() {
        datePicker.datePickerMode = .date
//        let fromDate = UserDefaults.standard.object(forKey: DefaultsKey.saveDateKey) as! Date
        datePicker.maximumDate = currentDate
        datePicker.setDate(currentDate, animated: true)
        
    }

    @IBAction func selectButtonClick(_ sender: UIButton) {
        self.delegate?.didSelectDate(datePicker.date)
        self.delegate?.didPressButton(sender)
    }

    @IBAction func cancelButtonClick(_ sender: UIButton) {
        self.delegate?.didPressButton(sender)
    }


}
