import XCTest
@testable import Foundational

final class Collection_Tests: XCTestCase {
    
    func test_isNotEmpty() {
        XCTAssertTrue([1,2,3].isNotEmpty)
        XCTAssertFalse([].isNotEmpty)
    }
    
    func test_ifNotEmpty() {
        
        XCTAssertNil([Int]().ifNotEmpty)
        XCTAssertEqual([1,2,3].ifNotEmpty, [1,2,3])
        
        XCTAssertNil("".ifNotEmpty)
        XCTAssertEqual("abc".ifNotEmpty, "abc")
    }
    
    func test_sorted() {
        
        let array = ["aaa", "bb", "c"]
        
        XCTAssertEqual(array.sorted(by: identity, order: .accending), array)
        XCTAssertEqual(array.sorted(by: identity, order: .decending), array.reversed())
        
        XCTAssertEqual(array.sorted(by: \.count, order: .accending), array.reversed())
        XCTAssertEqual(array.sorted(by: \.count, order: .decending), array)
    }
}
