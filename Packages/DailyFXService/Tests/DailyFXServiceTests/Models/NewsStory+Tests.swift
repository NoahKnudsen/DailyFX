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
            firstImageUrl: URL("https://example.com/first-image.png"),
            headlineImageUrl: URL("https://example.com/headline-image.png"),
            articleImageUrl: URL("https://example.com/article-image.png"),
            backgroundImageUrl: URL("https://example.com/background-image.png"),
            authors: [.minimalExample("David")],
            instruments: ["FOMC", "USD", "GOLD"],
            tags: ["Gold price forecast", "Spot gold analysis"],
            categories: ["forex", "market_alert"],
            displayDate: Date(timeIntervalSince1970: 1651564800000),
            lastUpdatedDate: Date(timeIntervalSince1970: 1651562724469)
        )
    )
    
    static func minimalExample(_ title: String) -> NewsStory {
        return NewsStory(
            title: title,
            url: URL("https://example.com"),
            description: "",
            content: nil,
            firstImageUrl: nil,
            headlineImageUrl: nil,
            articleImageUrl: nil,
            backgroundImageUrl: nil,
            authors: [],
            instruments: [],
            tags: [],
            categories: [],
            displayDate: Date(timeIntervalSince1970: 0),
            lastUpdatedDate: Date(timeIntervalSince1970: 1)
        )
    }
}
