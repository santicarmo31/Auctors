//
//  AuctionPresenter.swift
//  AuctionCreation
//
//  Created by Diego Pardo on 9/4/19.
//  Copyright © 2019 Apple Inc. All rights reserved.
//

import Foundation

protocol AuctionView: class {
    func display(_ viewModel: AuctionViewModel)
    func show(id: String)
}

class AuctionPresenter {
    // MARK: - Vars & Constants
    
    var service: AuctionService = .init()
    var auctionHolder: AuctionHolder?
    private unowned let view: AuctionView    
    
    
    // MARK: - Life cycle
    
    init(view: AuctionView) {
        self.view = view
    }
    
    // MARK: - Methods
    
    func fetchAuction() {
        service.get { [weak self] (response) in
            guard case .success(let response) = response else {
                print("Error auction must be returned or the service failed")
                return
            }
            
            self?.auctionHolder = response
            let viewModel = AuctionViewModel(model: response.auction)
            self?.view.display(viewModel)
        }
    }
    
    func updateAuctionHolder(with auction: Auction) {
        auctionHolder?.auction = auction
    }
    
    func post() {
        guard let jsonData = try? JSONEncoder().encode(auctionHolder),
            let decoded = try? JSONSerialization.jsonObject(with: jsonData, options: []),
            let dictFromJSON = decoded as? [String:Any]else {
            return
        }
        
        service.post(parameters: dictFromJSON) { [weak self] (response) in
            switch response {
            case .success(let id):
                self?.view.show(id: id)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
