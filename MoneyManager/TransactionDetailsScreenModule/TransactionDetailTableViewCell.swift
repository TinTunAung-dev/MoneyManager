//
//  TransactionDetailTableViewCell.swift
//  MoneyManager
//
//  Created by Tin Tun Aung on 25/01/2020.
//  Copyright © 2020 Tin Tun Aung. All rights reserved.
//

import UIKit

class TransactionDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var cellBackgroundView: UIView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
                
    private func setupUI() {
        cellBackgroundView.backgroundColor = .clear
    }
                
    func setData(category: String, note: String, type: String, amount: Double) {
        categoryLabel.text = category
        noteLabel.text = note
        typeLabel.text = type
        typeLabel.textColor = type == "Income" ? UIColor.systemGreen : UIColor.systemRed
        amountLabel.text = String(amount)
    }
    
}
