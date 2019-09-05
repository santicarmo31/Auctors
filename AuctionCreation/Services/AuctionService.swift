//
//  AuctionService.swift
//  AuctionCreation
//
//  Created by Diego Pardo on 9/4/19.
//  Copyright © 2019 Apple Inc. All rights reserved.
//

import Foundation
import Alamofire

enum AuctionServiceError: Error {
    case parse
    case general
}

class AuctionService {
    private let getEndpoint = "https://private-8fa34-auctioncreation.apiary-mock.com/auction"
    private let saveEndpoint = "https://test.publicsurplus.com/sms/rest/api/v1/auction"
    private let postHeaders = [
        "Bearer": "Y2Q4MjYwM2MtYmRmMC00OTNiLWEzZTItNmM2OWZhYzM3NWI3",
        "Content-Type": "application/json"
    ]
    
    func get(completion: @escaping((ServiceResponse<AuctionHolder>) -> Void)) {
        Alamofire.request(getEndpoint).responseData { (response) in
            switch response.result {
            case .success(let data):
                guard let auctionHolder = try? JSONDecoder().decode(AuctionHolder.self, from: data) else {
                    completion(.failure(AuctionServiceError.parse))
                    return
                }
                completion(.success(auctionHolder))
            case .failure:
                completion(.failure(AuctionServiceError.general))
            }
        }
    }
    
    func post(parameters: [String: Any], completion: @escaping((ServiceResponse<String>) -> Void)) {
        Alamofire.request(saveEndpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: postHeaders).responseJSON { (response) in
            switch response.result {
            case .success(let json):
                guard let json = json as? [String: Int] else {
                    completion(.failure(AuctionServiceError.parse))
                    return
                }
                completion(.success(String(json.values.first!)))
            case .failure(let error):
                print("Something went wrong when calling endpoint, \(error.localizedDescription)")
            }
        }
    }
}
