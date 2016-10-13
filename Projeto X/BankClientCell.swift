//
//  BankClientCell.swift
//  Projeto X
//
//  Created by Tales Pinheiro De Andrade on 12/10/16.
//  Copyright © 2016 Tales Pinheiro De Andrade. All rights reserved.
//

import UIKit
import CoreProjectX
import RealmSwift

class BankClientCell: UITableViewCell {

    @IBOutlet var name: UILabel!
    @IBOutlet var agency: UILabel!
    @IBOutlet var account: UILabel!
    @IBOutlet var balance: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configure(bankAccount: BankAccountClient) {
        self.name.text = bankAccount.name ?? "Client: - "
        self.agency.text = String(bankAccount.account)
        self.account.text = String(bankAccount.account)
        
        self.agency.text = String(bankAccount.account)
    }
    
}
