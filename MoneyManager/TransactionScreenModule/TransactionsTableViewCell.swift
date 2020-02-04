//
//  TransactionsTableViewCell.swift
//  MoneyManager
//
//  Created by Tin Tun Aung on 23/01/2020.
//  Copyright © 2020 Tin Tun Aung. All rights reserved.
//

import UIKit

class TransactionsTableViewCell: UITableViewCell {
    @IBOutlet weak var cellBackgroundView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    
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
            
    func setData(createdDate: String) {
        dateLabel.text = createdDate
    }
}
