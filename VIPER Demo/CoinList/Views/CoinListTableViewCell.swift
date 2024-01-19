//
//  CoinListTableViewCell.swift
//  VIPER Demo
//
//  Created by Yadar Tulayathamrong on 18/1/2567 BE.
//

import UIKit

class CoinListTableViewCell: UITableViewCell {
    
    public static let identifier : String  = "CoinListTableViewCell"
    
    @IBOutlet weak var coinName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
