//
//  AuctionTableViewController.swift
//  AuctionCreation
//
//  Created by Diego Pardo on 9/4/19.
//  Copyright © 2019 Apple Inc. All rights reserved.
//

import UIKit

class AuctionTableViewController: UITableViewController {
    
    // MARK: - Vars & Constants
    
    private var presenter: AuctionPresenter!
    private var viewModel: AuctionViewModel?
    private let alerActionTitle = "ok"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupCells()
        setupPresenter()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel != nil ? 1 : 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AuctionTableViewCell.identifier, for: indexPath) as! AuctionTableViewCell
        
        if let viewModel = viewModel {
            cell.setup(with: viewModel)
        }

        return cell
    }
    
    // MARK: - IBActions
    
    @IBAction func saveAuction(_ sender: Any) {
        guard let cell = tableView.visibleCells.first as? AuctionTableViewCell, viewModel != nil else {
            return
        }
        let milliseconds = cell.defaultPickerView.date.millisecondsSince1970
        viewModel!.model.update(actualEndDate: Int(milliseconds), description: cell.descriptionTextfield.text!, quantity: Int(cell.quantityTextfield.text!) ?? 0, title: cell.titleTextfield.text!)
        presenter.updateAuctionHolder(with: viewModel!.model)
        presenter.post()
    }
    
    // MARK: - Methods
    
    private func setupTableView() {
        tableView.estimatedRowHeight = 70.0
        tableView.rowHeight = UITableView.automaticDimension
    }

    private func setupCells() {
        let nib = UINib(nibName: AuctionTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: AuctionTableViewCell.identifier)
    }
    
    private func setupPresenter() {
        presenter = AuctionPresenter(view: self)
        presenter.fetchAuction()
    }
}

// MARK: - ActionView Conformance

extension AuctionTableViewController: AuctionView {
    func show(id: String) {
        let alert = UIAlertController(title: id, message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: alerActionTitle, style: .default, handler: nil)
        alert.addAction(action)
        
        DispatchQueue.main.async { [weak self] in
            self?.present(alert, animated: true, completion: nil)
        }
    }
    
    func display(_ viewModel: AuctionViewModel) {
        self.viewModel = viewModel
        DispatchQueue.main.async { [weak tableView] in
            tableView?.reloadData()
        }
    }
}
