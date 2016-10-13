//
//  ClicentDataSource.swift
//  Projeto X
//
//  Created by Tales Pinheiro De Andrade on 12/10/16.
//  Copyright © 2016 Tales Pinheiro De Andrade. All rights reserved.
//

import UIKit
import CoreProjectX
import RealmSwift

class ClicentDataSource: NSObject, UITableViewDataSource {
    
    var results: Results<BankAccountClient>?
    var notificationToken: NotificationToken?
    private weak var tableView: UITableView?
    
    override init() {
        super.init()
        BankAccountClient.fetch { result in
            switch result {
            case let .success(results):
                self.results = results
                
                self.notificationToken = results.addNotificationBlock { (changes: RealmCollectionChange) in
                    switch changes {
                    case .initial:
                        // Results are now populated and can be accessed without blocking the UI
                        self.tableView?.reloadData()
                    case .update(_, let deletions, let insertions, let modifications):
                        // Query results have changed, so apply them to the TableView
                        self.tableView?.beginUpdates()
                        self.tableView?.insertRows(at: insertions.map { IndexPath(row: $0, section: 0) }, with: .automatic)
                        self.tableView?.deleteRows(at: deletions.map { IndexPath(row: $0, section: 0) }, with: .automatic)
                        self.tableView?.reloadRows(at: modifications.map { IndexPath(row: $0, section: 0) }, with: .automatic)
                        self.tableView?.endUpdates()
                    case .error(let error):
                        // An error occurred while opening the Realm file on the background worker thread
                        fatalError("\(error)")
                    }
                }
            case let .error(error):
                fatalError("\(error)")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.tableView = self.tableView ?? tableView
        return results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.tableView = self.tableView ?? tableView
        
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as BankClientCell
        
        guard let bankAccountClient = results?[indexPath.row] else { return cell }
        
        cell.configure(bankAccount: bankAccountClient)
        
        return cell
    }
}
