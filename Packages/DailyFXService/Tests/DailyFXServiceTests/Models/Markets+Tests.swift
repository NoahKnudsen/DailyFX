import XCTest
@testable import DailyFXService

final class Markets_Tests: XCTestCase {
    
    func test_decode() throws {
        
        try Markets.testData.testDecode()
    }
    
    func test_codable_identity() throws {
        
        try Markets.testData.testCodableIdentity()
    }
}

extension Markets {
    
    static let testData = TestDataModel(
        jsonResource: "markets.json",
        model: Markets(
            currencies: [.init()],
            commodities: [.init()],
            indices: [.init()]
        )
    )
}

private extension Market {
    
    init() {
        self.init(
            displayName: "display",
            marketId: "id",
            epic: "epic",
            rateDetailURL: URL("https://example.com"),
            topMarket: false,
            unscalingFactor: 100,
            unscaledDecimals: 3,
            calendarMapping: ["USD"]
        )
    }
}
