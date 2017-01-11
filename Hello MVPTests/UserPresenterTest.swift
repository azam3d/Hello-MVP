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

class UserViewMock: NSObject, UserView {
    var setUsersCalled = false
    var setEmptyUsersCalled = false
    
    func setUsers(users: [UserViewData]) {
        setUsersCalled = true
    }
    
    func setEmptyUsers() {
        setEmptyUsersCalled = true
    }
    
    func startLoading() {}
    
    func finishLoading() {}
}

class UserPresenterTest: XCTestCase {
    let emptyUsersServiceMock = UserServiceMock(users: [User]())
    
    let towUsersServiceMock = UserServiceMock(
        users:[User(firstName: "firstname1", lastName: "lastname1", email: "first@test.com",  age: 30),
               User(firstName: "firstname2", lastName: "lastname2", email: "second@test.com", age: 24)])
    
    func testShouldSetUsers() {
        //given
        let userViewMock = UserViewMock()
        let userPresenterUnderTest = UserPresenter(userService: towUsersServiceMock)
        userPresenterUnderTest.attachView(view: userViewMock)
        
        //when
        userPresenterUnderTest.getUsers()
        
        //verify
        XCTAssertTrue(userViewMock.setUsersCalled)
    }
    
    func testShouldSetEmptyIfNoUserAvailable() {
        //given
        let userViewMock = UserViewMock()
        let userPresenterUnderTest = UserPresenter(userService: emptyUsersServiceMock)
        userPresenterUnderTest.attachView(view: userViewMock)
        
        //when
        userPresenterUnderTest.getUsers()
        
        //verify
        XCTAssertTrue(userViewMock.setEmptyUsersCalled)
    }
}
