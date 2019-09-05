//
//  AuctionPresenter.swift
//  AuctionCreation
//
//  Created by Diego Pardo on 9/4/19.
//  Copyright © 2019 Apple Inc. All rights reserved.
//

import Foundation

protocol AuctionView: class {
    func display(_ auction: AuctionViewModel)
    func show(id: String)
}

class AuctionPresenter {
    var service: AuctionService = .init()
    let getEndpoint = "https://private-8fa34-auctioncreation.apiary-mock.com/auction"
    let saveEndpoint = "https://test.publicsurplus.com/sms/rest/api/v1/auction"
    
    unowned let view: AuctionView
    
    init(view: AuctionView) {
        self.view = view
    }
    
    
    func fetchAuction() {
        service.get(url: getEndpoint, headers: [:]) { [weak self] (response) in
            if case .success(let auction) = response {
                guard let auction = auction else {
                    print("Error auction must be returned")
                    return
                }
                
                let viewModel = AuctionViewModel(model: auction)
                self?.view.display(viewModel)
            }
        }
    }
    
    func post(response: AuctionResponse) {
        let jsonData = try! JSONEncoder().encode(response)
        let jsonString = String(data: jsonData, encoding: .utf8)!
        guard let decoded = try? JSONSerialization.jsonObject(with: jsonData, options: []) else {
            return
        }
        // here "decoded" is of type `Any`, decoded from JSON data
        
        // you can now cast it with the right type
        if let dictFromJSON = decoded as? [String:Any] {
            service.post(url: saveEndpoint, headers: ["Bearer": "Y2Q4MjYwM2MtYmRmMC00OTNiLWEzZTItNmM2OWZhYzM3NWI3", "Content-Type": "application/json"], parameters: dictFromJSON) { [weak self] (response) in
                switch response {
                case .success(let id):
                    if let id = id {
                        self?.view.show(id: id)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
