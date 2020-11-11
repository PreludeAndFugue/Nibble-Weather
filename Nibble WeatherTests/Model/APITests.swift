//
//  APITests.swift
//  Nibble WeatherTests
//
//  Created by gary on 11/11/2020.
//

import XCTest
@testable import Nibble_Weather

class APITests: XCTestCase {
    func testGet() throws {
        let api = API()
        let expectation = self.expectation(description: "API test")
        api.get() { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let cities):
                for city in cities {
                    print(city.name)
                    print(city.sys.timezone)
                    print()
                }
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
}
