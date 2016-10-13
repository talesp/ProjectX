//
//  BankAccountClient.swift
//  Projeto X
//
//  Created by Tales Pinheiro De Andrade on 12/10/16.
//  Copyright © 2016 Tales Pinheiro De Andrade. All rights reserved.
//

import Foundation
import RealmSwift

public class BankAccountClient: Object {
    public dynamic var name: String?
    public dynamic var agency: Int = 0
    public dynamic var account: Int = 0
    public dynamic var securityDigity: Int = 0
    public dynamic var balance: Double = 0.0
    
    public static func fetch(completion: @escaping (Result<Results<BankAccountClient>>) -> Void) {
        do {
            let realm = try Realm()
            completion(Result.success(realm.objects(BankAccountClient.self).sorted(byProperty: "name")))
        } catch let error {
            completion(.error(error))
        }
    }
    
    public func save() {
        do {
            let realm = try Realm()
            
            realm.beginWrite()
            realm.add(self)
            try realm.commitWrite()
        } catch let error {
            fatalError("\(error)")
        }
        
        
    }
}
