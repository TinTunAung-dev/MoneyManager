//
//  HomeScreenView.swift
//  MoneyManager
//
//  Created Tin Tun Aung on 20/01/2020.
//  Copyright © 2020 Tin Tun Aung. All rights reserved.
//
//  Template generated by Tin Tun Aung
//
import Foundation
import UIKit

class HomeScreenView: UIViewController {
    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var expenseLabel: UILabel!
    @IBOutlet weak var incomeLabel: UILabel!
    @IBOutlet weak var savingLabel: UILabel!
    
    @IBOutlet weak var showAllTransactionView: UIView!
    @IBOutlet weak var addIncomeView: UIView!
    @IBOutlet weak var addExpenseView: UIView!
    
    var presenter: HomeScreenViewToPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.started()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        presenter?.getData(dateTF.stringValue)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @objc func dateButtonClick(_ sender: UIButton) {
        presenter?.clickDateButton()
    }
    
    @objc func addIncomeViewClick(_ sender:UITapGestureRecognizer){
        AppStates.shared.setIncome = true
        presenter?.clickViews(screenName: ScreenName.addIncome)
    }
    
    @objc func addExpenseViewClick(_ sender:UITapGestureRecognizer){
        AppStates.shared.setIncome = false
        presenter?.clickViews(screenName: ScreenName.addExpense)
    }
    
    @objc func showAllTransactionViewClick(_ sender:UITapGestureRecognizer){
        presenter?.clickViews(screenName: ScreenName.showTransactions)
    }

}

// MARK: - UISetup
extension HomeScreenView {
    private func setup() {
        defaultUI()
        textfieldSetup()
        buttonSetup()
        viewSetup()
        setupGestures()
    }
    
    private func defaultUI() {
        
    }
    
    private func textfieldSetup() {
        dateTF.textFieldStyle()
        self.dateTF.text = currentDate.formatter()
    }
    
    private func buttonSetup() {
        dateButton()
    }
    
    private func dateButton() {
        let dateButton = UIButton()
        dateTF.addButton(button: dateButton, image: #imageLiteral(resourceName: "calendarWithTime"))
        dateButton.addTarget(self, action: #selector(dateButtonClick(_:)), for: .touchUpInside)
    }

    private func viewSetup() {
        showAllTransactionView.setRoundedCornerView()
        addIncomeView.setRoundedCornerView()
        addExpenseView.setRoundedCornerView()
    }
    
    private func setupGestures() {
        let addIncomeGesture = UITapGestureRecognizer(target: self, action: #selector(addIncomeViewClick(_:)))
        self.addIncomeView.addGestureRecognizer(addIncomeGesture)
        let addExpenseGesture = UITapGestureRecognizer(target: self, action: #selector(addExpenseViewClick(_:)))
        self.addExpenseView.addGestureRecognizer(addExpenseGesture)
        let showTransactionsGesture = UITapGestureRecognizer(target: self, action: #selector(showAllTransactionViewClick(_:)))
        self.showAllTransactionView.addGestureRecognizer(showTransactionsGesture)
    }
}

// MARK: - Presenter to View
extension HomeScreenView: HomeScreenPresenterToViewProtocl {
    func passData(_ income: Double, _ expense: Double, savings: Double) {
        incomeLabel.text = String(income)
        expenseLabel.text = String(expense)
        savingLabel.text = String(savings)
    }
    
    func showDatePicker() {
        let vc = SelectDateViewController(nibName: NibName.selectDateNib, bundle: nil)
        vc.delegate = self
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
    }

    func initialControlSetup() {
        setup()
    }

}

extension HomeScreenView: SelectDateDelegate {
    func didSelectDate(_ selectedDate: Date) {
        
        self.dateTF.text = selectedDate.formatter()
        presenter?.getData(dateTF.stringValue)
    }

    func didPressButton(_ button: UIButton!) {
        UIView.animate(withDuration: 0.5) {
            self.view.endEditing(true)
        }
    }
}