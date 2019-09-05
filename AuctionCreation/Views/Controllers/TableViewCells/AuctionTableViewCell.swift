//
//  AuctionTableViewCell.swift
//  AuctionCreation
//
//  Created by Diego Pardo on 9/4/19.
//  Copyright © 2019 Apple Inc. All rights reserved.
//

import UIKit

class AuctionTableViewCell: UITableViewCell, ReusableIdentifier {
    
    
    @IBOutlet  weak var actualEndDateTextfield: UITextField!
    @IBOutlet  weak var conditionCodeNameTextfield: UITextField!
    @IBOutlet  weak var descriptionTextfield: UITextField!
    @IBOutlet  weak var quantityTextfield: UITextField!
    @IBOutlet  weak var titleTextfield: UITextField!
    
    let defaultPickerView = UIDatePicker()

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(with viewModel: AuctionViewModel) {
        actualEndDateTextfield.text = viewModel.actualEndDate
        conditionCodeNameTextfield.text = viewModel.conditionCodeName
        descriptionTextfield.text = viewModel.description
        quantityTextfield.text = viewModel.quantity
        titleTextfield.text = viewModel.title
        setInputViews(startingDate: viewModel.date)
    }
    
    func setInputViews(startingDate: Date){
        
        defaultPickerView.setDate(startingDate, animated: false)
        defaultPickerView.addTarget(self, action: #selector(selectDate(sender:)), for: .valueChanged)
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil, action: nil)
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done,
                                            target: self, action: #selector(hideTextField))
        keyboardToolbar.items = [flexBarButton, doneBarButton]
        
        actualEndDateTextfield.inputAccessoryView = keyboardToolbar
        actualEndDateTextfield.inputView = defaultPickerView
    }
    
//    func addDoneInputButton() {
//        let keyboardToolbar = UIToolbar()
//        keyboardToolbar.sizeToFit()
//        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
//                                            target: nil, action: nil)
//        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done,
//                                            target: self, action: #selector(hideTextField))
//        keyboardToolbar.items = [flexBarButton, doneBarButton]
//
//        actualEndDateTextfield.inputAccessoryView = keyboardToolbar
//    }
    
    @objc private func hideTextField() {
        actualEndDateTextfield.resignFirstResponder()
    }
    
    @objc private func selectDate(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        actualEndDateTextfield.text = dateFormatter.string(from: sender.date)
    }
}

extension AuctionTableViewCell: UIPickerViewDelegate {
    
}
