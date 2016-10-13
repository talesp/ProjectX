//
//  ViewController.swift
//  Projeto X
//
//  Created by Tales Pinheiro De Andrade on 10/10/16.
//  Copyright © 2016 Tales Pinheiro De Andrade. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet var tableView: UITableView?
    
    let dataSource = ClicentDataSource()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView?.register(class: BankClientCell.self)
        tableView?.dataSource = dataSource
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

