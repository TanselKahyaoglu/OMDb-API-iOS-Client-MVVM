//
//  MainViewModelTest.swift
//  MovieApp-Client-Tests
//
//  Created by Tansel Kahyaoglu on 30.08.2020.
//  Copyright © 2020 Tansel Kahyaoglu. All rights reserved.
//

import XCTest
@testable import MovieApp_Client

class MainViewModelTest: XCTestCase {
    
    var viewModel: MainViewModel?
    
    override func setUp() {
        super.setUp()
        viewModel = MainViewModel(movieService: MovieServiceMock())
    }

    func testInit() {
        XCTAssertNotNil(viewModel)
    }
    
    func testGetMoviesSuccess() {
        viewModel?.doSearch(keyword: "success")
        XCTAssertFalse((viewModel?.movieArr.isEmpty ?? false))
    }
    
    func testGetMoviesFailed() {
        viewModel?.doSearch(keyword: "fail")
        XCTAssertTrue(viewModel?.movieArr.isEmpty ?? true)
    }
    
    func testFilter() {
        viewModel?.doSearch(keyword: "success")
        viewModel?.filterResults(.Movie)
        XCTAssertFalse(viewModel?.movieArr.isEmpty ?? false)
    }

}
