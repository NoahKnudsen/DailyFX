import XCTest
@testable import DailyFXService

final class Endpoint_Tests: XCTestCase {
    
    func test_endpoints_compile() throws {
        
        _ = Endpoint.allCases.map(\.url)
    }
}
