import XCTest
@testable import DailyFXService

final class NewsStory_Tests: XCTestCase {
    
    func test_decode() throws {
        
        try NewsStory.testData.testDecode()
    }
    
    func test_codable_identity() throws {
        
        try NewsStory.testData.testCodableIdentity()
    }
}

extension NewsStory {
    
    static let testData = TestDataModel(
        jsonResource: "news-story.json",
        model: NewsStory(
            title: "Gold Price Forecast...",
            url: URL("https://www.example.com"),
            description: "Lower gold prices endure...",
            content: nil,
            headlineImageUrl: URL("https://example.com/headline-image.png"),
            authors: [Author(name: "David")],
            instruments: ["FOMC", "USD", "GOLD"],
            tags: ["Gold price forecast", "Spot gold analysis"],
            categories: ["forex", "market_alert"]
        )
    )
    
    init(_ title: String) {
        self.init(title: title, url: URL("https://example.com"))
    }
}
