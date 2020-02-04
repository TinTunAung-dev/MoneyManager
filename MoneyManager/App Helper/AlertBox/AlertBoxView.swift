//
//  AlertBoxView.swift
//
//  Created by Tin Tun Aung on 9/24/19.
//  Copyright © 2019 Tin Tun Aung. All rights reserved.
//

import Foundation
import UIKit

class AlertBoxView: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var okButton: UIButton!
    
    var alertTitle = String()
    var alertMessage = String()
    
    var okBtnShowHide = Bool()
    var okBtnTitle = String()
    
    var cancelBtnShowHide = Bool()
    var cancelBtnTitle = String()
    
    var separateShowHide = Bool()
    
    var okBtnAction: (() -> ())?
    var cancelBtnAction: (() ->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveEaseIn, animations: {
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        }, completion: nil)
    }

    func setupView() {
        titleLabel.text = alertTitle
        messageLabel.text = alertMessage
        
        okButton.setTitle(okBtnTitle, for: .normal)
        cancelButton.setTitle(cancelBtnTitle, for: .normal)
        okButton.isHidden = okBtnShowHide
        cancelButton.isHidden = cancelBtnShowHide
    }
    
    @IBAction func noButtonAction(_ sender: UIButton) {
        cancelBtnAction?()
    }
    
    @IBAction func yesButtonAction(_ sender: UIButton) {
        okBtnAction?()
    }
    
}
