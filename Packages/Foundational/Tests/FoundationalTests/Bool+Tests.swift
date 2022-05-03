import XCTest
@testable import Foundational

final class Bool_Tests: XCTestCase {
    
    func test_not() {
        XCTAssertTrue(false.not)
        XCTAssertFalse(true.not)
    }
}
