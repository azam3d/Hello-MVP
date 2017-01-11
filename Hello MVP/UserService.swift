//
//  UserService.swift
//  Hello MVP
//
//  Created by Muhammad Azam Bin Baderi on 1/10/17.
//  Copyright © 2017 Muhammad Azam Bin Baderi. All rights reserved.
//

import Foundation

class UserService {
    //the service delivers mocked data with a delay
    func getUsers(callBack: @escaping ([User]) -> Void){
        let users = [User(firstName: "Iyad", lastName: "Agha", email: "iyad@test.com", age: 36),
                     User(firstName: "Mila", lastName: "Haward", email: "mila@test.com", age: 24),
                     User(firstName: "Mark", lastName: "Astun", email: "mark@test.com", age: 39)
        ]
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            callBack(users)
        }
    }
}
