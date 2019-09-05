//
//  AuctionTableViewCell.swift
//  AuctionCreation
//
//  Created by Diego Pardo on 9/4/19.
//  Copyright © 2019 Apple Inc. All rights reserved.
//

import UIKit

class AuctionTableViewCell: UITableViewCell, ReusableIdentifier {
    // MARK: - IBOutlets
    
    @IBOutlet weak var actualEndDateTextfield: UITextField!
    @IBOutlet weak var conditionCodeNameTextfield: UITextField!
    @IBOutlet weak var descriptionTextfield: UITextField!
    @IBOutlet weak var quantityTextfield: UITextField!
    @IBOutlet weak var titleTextfield: UITextField!
    
    // MARK: - Vars & Constants
    
    let datePickerView = UIDatePicker()
    private let dateFormat = "dd MMM yyyy"
    
    // MARK: - Life Cycle

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Methods
    
    func setup(with viewModel: AuctionViewModel) {
        actualEndDateTextfield.text = viewModel.actualEndDate
        conditionCodeNameTextfield.text = viewModel.conditionCodeName
        descriptionTextfield.text = viewModel.description
        quantityTextfield.text = viewModel.quantity
        titleTextfield.text = viewModel.title
        configureDatePicker(startingDate: viewModel.date)
        setInputViews()
    }
    
    private func configureDatePicker(startingDate: Date) {
        datePickerView.setDate(startingDate, animated: false)
        datePickerView.addTarget(self, action: #selector(selectDate(sender:)), for: .valueChanged)
    }
    
    private func setInputViews(){
        let keyboardToolbar = UIToolbar()
        let flexBarButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        let doneBarButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(hideTextField)
        )
        
        keyboardToolbar.sizeToFit()
        keyboardToolbar.items = [flexBarButton, doneBarButton]
        
        actualEndDateTextfield.inputAccessoryView = keyboardToolbar
        actualEndDateTextfield.inputView = datePickerView
    }
    
    @objc private func hideTextField() {
        actualEndDateTextfield.resignFirstResponder()
    }
    
    @objc private func selectDate(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        actualEndDateTextfield.text = dateFormatter.string(from: sender.date)
    }
}
