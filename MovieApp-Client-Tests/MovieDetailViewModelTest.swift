//
//  MovieDetailViewModelTest.swift
//  MovieApp-Client-Tests
//
//  Created by Tansel Kahyaoglu on 30.08.2020.
//  Copyright © 2020 Tansel Kahyaoglu. All rights reserved.
//

import XCTest
@testable import MovieApp_Client

class MovieDetailViewModelTest: XCTestCase {

    var viewModel: DetailsViewModel?
    
    override func setUp() {
        super.setUp()
        viewModel = DetailsViewModel(movieService: MovieServiceMock())
    }

    func testInitWithMockService() {
        XCTAssertNotNil(viewModel)
    }
    
    func testInit() {
        XCTAssertNotNil(DetailsViewModel())
    }
    
    func testGetMovieDetilSuccess() {
        viewModel?.getMovieDetails(id: "success")
    }
    
    func testGetMovieDetailFailed() {
        viewModel?.getMovieDetails(id: "fail")
    }
    
}
