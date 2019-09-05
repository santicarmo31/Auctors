//
//  ServiceResponse.swift
//  AuctionCreation
//
//  Created by Santiago Carmona Gonzalez on 9/4/19.
//  Copyright © 2019 Apple Inc. All rights reserved.
//

import Foundation

enum ServiceResponse<Type> {
    case success(Type)
    case failure(Error)
}
