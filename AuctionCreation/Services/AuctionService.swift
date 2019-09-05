//
//  AuctionService.swift
//  AuctionCreation
//
//  Created by Diego Pardo on 9/4/19.
//  Copyright © 2019 Apple Inc. All rights reserved.
//

import Foundation
import Alamofire

enum ServiceResponse<Type> {
    case success(Type)
    case failure(Error)
}

struct AuctionResponse {
    var auction: Auction
    let addresses: [Address]
    let entityDescriptionTemplateData: [String]
    let categories: [Category]
    
    private enum Keys: String, CodingKey {
        case auction
        case addresses
        case entityDescriptionTemplateData
        case categories
    }
    
}

extension AuctionResponse: Codable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        let auction: Auction = try container.decode(Auction.self, forKey: .auction)
        let addresses: [Address] = try container.decode([Address].self, forKey: .addresses)
        let entityDescriptionTemplateData: [String] = try container.decode([String].self, forKey: .entityDescriptionTemplateData)
        let categories: [Category] = try container.decode([Category].self, forKey: .categories)
        
        self.init(auction: auction, addresses: addresses, entityDescriptionTemplateData: entityDescriptionTemplateData, categories: categories)
    }
    
}

class AuctionService {
    
    func get(url: String, headers: [String: String], completion: @escaping((ServiceResponse<AuctionResponse?>) -> Void)) {
        Alamofire.request(url, headers: headers).responseData { (response) in
            switch response.result {
            case .success(let data):
                var auction: AuctionResponse?
                do {
                    auction = try JSONDecoder().decode(AuctionResponse.self, from: data)
                    completion(.success(auction))
                } catch(let error) {
                    print(error)
                }
                print(data)
            case .failure(let error):
                print("Something went wrong when calling endpoint: \(url), \(error.localizedDescription)")
            }
        }
    }
    
    func post(url: String, headers: [String: String], parameters: [String: Any], completion: @escaping((ServiceResponse<String?>) -> Void)) {
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            switch response.result {
            case .success(let json):
                if let json = json as? [String: Int] {
                    completion(.success(String(json.values.first!)))
                    return
                }
                completion(.success("No key"))
            case .failure(let error):
                print("Something went wrong when calling endpoint: \(url), \(error.localizedDescription)")
            }
        }
    }
}
