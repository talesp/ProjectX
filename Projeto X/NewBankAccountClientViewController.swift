//
//  NewBankAccountClientViewController.swift
//  Projeto X
//
//  Created by Tales Pinheiro De Andrade on 13/10/16.
//  Copyright © 2016 Tales Pinheiro De Andrade. All rights reserved.
//

import UIKit
import CoreProjectX
import RealmSwift

class NewBankAccountClientViewController: UIViewController {

    @IBOutlet var save: UIButton!
    
    @IBOutlet var name: UITextField!
    @IBOutlet var agency: UITextField!
    @IBOutlet var account: UITextField!
    @IBOutlet var digit: UITextField!
    @IBOutlet var balance: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func save(_ sender: Any) {
        let bank = BankAccountClient()
        bank.account = Int(account.text ?? "0")!
        bank.agency = Int(agency.text ?? "0")!
        bank.securityDigity = Int(digit.text ?? "0")!
        bank.balance = Double(balance.text ?? "0.0")!
        bank.save()
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
