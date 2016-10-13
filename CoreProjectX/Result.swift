//
//  Result.swift
//  Projeto X
//
//  Created by Tales Pinheiro De Andrade on 12/10/16.
//  Copyright © 2016 Tales Pinheiro De Andrade. All rights reserved.
//

import Foundation

public enum Result<T>{
    
    case success(T)
    case error(Error)
    
}
