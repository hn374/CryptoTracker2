//
//  CryptoTableViewCell.swift
//  CryptoTracker
//
//  Created by Maxwell Stein on 12/14/17.
//  Copyright © 2017 Maxwell Stein. All rights reserved.
//

import UIKit

class CryptoTableViewCell: UITableViewCell {

    @IBOutlet weak var currencyImageView: UIImageView!
    @IBOutlet weak var currencyName: UILabel!
    @IBOutlet weak var currencyPrice: UILabel!
    
    func formatCell(withCurrencyType currencyType: CurrencyType) {
        currencyName.text = currencyType.name
        currencyImageView.image = currencyType.image
        
        currencyType.requestValue { (value) in
            DispatchQueue.main.async {
                self.currencyPrice.text = value?.formattedCurrencyString ?? "Failed to get price."
            }
            
        }
    }

}


private extension NSNumber {
    var formattedCurrencyString: String? {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.numberStyle = .currency
        return formatter.string(from: self)
    }
}
