//
//  TransactionDetailsScreenView.swift
//  MoneyManager
//
//  Created Tin Tun Aung on 25/01/2020.
//  Copyright © 2020 Tin Tun Aung. All rights reserved.
//
//  Template generated by Tin Tun Aung
//
import Foundation
import UIKit

class TransactionDetailsScreenView: UIViewController {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var transactionRecords = [Record]()
    var presenter: TransactionDetailsScreenViewToPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.started()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.getData()
        tableView.reloadData()
    }
}

// MARK: - UISetup
extension TransactionDetailsScreenView {
    private func setup() {
        defaultUI()
        tableViewSetup()
    }
    
    private func defaultUI() {
        self.navigationController?.navigationStyle()
        self.title = "Transaction Detail"
        self.navigationItem.backButtonStyle()
        self.tableView.tableViewUIStyle()
    }
    
    private func tableViewSetup() {
        tableView.delegate = self
        tableView.dataSource = self
        registerCell()
    }
    
    private func registerCell() {
        let transactionDetailNib = UINib(nibName: NibName.transactionDetailNib, bundle: nil)
        tableView.register(transactionDetailNib, forCellReuseIdentifier: CellID.transactionDetailCell)
    }
}

// MARK: - Presenter to View
extension TransactionDetailsScreenView: TransactionDetailsScreenPresenterToViewProtocl {
    func deleteSuccess(records: [Record]) {
        transactionRecords = records
        tableView.reloadData()
        if transactionRecords.isEmpty {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func showAlertBox(_ record: Record) {
        deleteAlertBox {
            self.presenter?.clickDelete(record)
        }
    }
    
    func passData(records: [Record]) {
        transactionRecords = records
        dateLabel.text = records.first?.createdDate
        tableView.reloadData()
    }
    
    func initialControlSetup() {
        setup()
    }

}

// MARK: - TableView extension
extension TransactionDetailsScreenView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactionRecords.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellID.transactionDetailCell, for: indexPath) as! TransactionDetailTableViewCell
        let category = transactionRecords[indexPath.row].category
        let note = transactionRecords[indexPath.row].note
        let type = transactionRecords[indexPath.row].type
        let amount = transactionRecords[indexPath.row].amount
        cell.setData(category: category, note: note, type: type, amount: amount)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let record = transactionRecords[indexPath.row]
        presenter?.clickRecord(record)
    }
}
