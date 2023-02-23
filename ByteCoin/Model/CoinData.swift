//
//  CoinData.swift
//  ByteCoin
//
//  Created by Saurabh Mirajkar on 23/02/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct CoinData: Codable {
    let time: String
    let assetIDBase: String
    let assetIDQuota: String
    let rate: Double
    
    enum CodingKeys: String, CodingKey {
        case time
        case assetIDBase = "asset_id_base"
        case assetIDQuota = "asset_id_quote"
        case rate
    }
}
