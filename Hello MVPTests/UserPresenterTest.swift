//
//  UserPresenterTest.swift
//  Hello MVP
//
//  Created by Muhammad Azam Bin Baderi on 1/11/17.
//  Copyright © 2017 Muhammad Azam Bin Baderi. All rights reserved.
//

import XCTest
@testable import Hello_MVP

class UserServiceMock: UserService {
    private let users: [User]
    
    init(users: [User]) {
        self.users = users
    }
    
    override func getUsers(callBack: @escaping ([User]) -> Void) {
        callBack(users)
    }
}

class UserViewMock: NSObject, UserView{
    var setUsersCalled = false
    var setEmptyUsersCalled = false
    
    func setUsers(users: [UserViewData]) {
        setUsersCalled = true
    }
    
    func setEmptyUsers() {
        setEmptyUsersCalled = true
    }
    
    func startLoading() {
    }
    
    func finishLoading() {
    }
}

class UserPresenterTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
