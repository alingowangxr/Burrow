//
//  DiskScannerTests.swift
//  BurrowTests
//

import XCTest
@testable import Burrow

final class DiskScannerTests: XCTestCase {
    func testHomeScanSkipsProtectedTopLevelFoldersOnly() {
        let home = "/Users/example"

        XCTAssertTrue(DiskScanner.shouldSkipInHomeScan("/Users/example/Library", homeDirectory: home))
        XCTAssertTrue(DiskScanner.shouldSkipInHomeScan("/Users/example/Desktop", homeDirectory: home))
        XCTAssertTrue(DiskScanner.shouldSkipInHomeScan("/Users/example/Documents", homeDirectory: home))
        XCTAssertTrue(DiskScanner.shouldSkipInHomeScan("/Users/example/Downloads", homeDirectory: home))
        XCTAssertTrue(DiskScanner.shouldSkipInHomeScan("/Users/example/.config", homeDirectory: home))
        XCTAssertFalse(DiskScanner.shouldSkipInHomeScan("/Users/example/Projects", homeDirectory: home))
        XCTAssertFalse(DiskScanner.shouldSkipInHomeScan("/Users/example/Documents/Library", homeDirectory: home))
    }
}
