//
//  ReusableIdentifier.swift
//  AuctionCreation
//
//  Created by Diego Pardo on 9/4/19.
//  Copyright © 2019 Apple Inc. All rights reserved.
//

import Foundation

protocol ReusableIdentifier {
    static var identifier: String { get }
}

extension ReusableIdentifier {
    static var identifier: String {
        return String(describing: self)
    }
}
