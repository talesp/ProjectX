//
//  UITableView.swift
//  Projeto X
//
//  Created by Tales Pinheiro De Andrade on 12/10/16.
//  Copyright © 2016 Tales Pinheiro De Andrade. All rights reserved.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(class: T.Type)
        where T: ReusableView, T: NibLoadableView {
            
            let nib = UINib(nibName: T.nibName, bundle: nil)
            register(nib, forCellReuseIdentifier: T.reuseIdentifier)
            
    }
    
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T
        where T: ReusableView {
            guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier,
                                                 for: indexPath) as? T
                else { fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)") }
            return cell
    }
}
