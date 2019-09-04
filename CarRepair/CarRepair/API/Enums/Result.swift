//
//  Result.swift
//  CarRepair
//
//  Created by mariana.alvarez on 9/3/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

enum Result<T>{
    case success(T)
    case failure(String)
}
