//
//  SelectCategoryTableViewCell.swift
//  MoneyManager
//
//  Created by Tin Tun Aung on 21/01/2020.
//  Copyright © 2020 Tin Tun Aung. All rights reserved.
//

import UIKit

class SelectCategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var cellBackgroundView: UIView!
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
        
    func setData(categoryName: String) {
        categoryNameLabel.text = categoryName
    }
    
}
