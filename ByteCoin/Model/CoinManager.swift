//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "6C3FBA59-6C5E-46F4-AB03-0870F6945EDD"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    // https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=6C3FBA59-6C5E-46F4-AB03-0870F6945EDD
    func getCoinPrice(for currency: String) {
        let urlString = baseURL + "/" + currency + "?apikey=" + apiKey
        self.performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    return
                }
                
                if let data {
                    if let rate = parseJson(data) {
                        print(String(format: "%.02f", rate))
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJson(_ data: Data) -> Double? {
        let decoder = JSONDecoder()
        do {
            let result = try decoder.decode(CoinData.self, from: data)
            let rate = result.rate
            return rate
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }

    
}
