import XCTest
@testable import DailyFXService

final class Author_Tests: XCTestCase {
    
    func test_decode() throws {
        
        try Author.testData.testDecode()
    }
    
    func test_codable_identity() throws {
        
        try Author.testData.testCodableIdentity()
    }
}

extension Author {
    
    static let testData = TestDataModel(
        jsonResource: "author.json",
        model: Author(
            name: "David Attenborough",
            title: "Analyst",
            bio: URL("https://www.example.com/david_attenborugh"),
            email: "david@ttenborough.com",
            phone: "077074083748",
            facebook: URL("https://www.facebook.com"),
            twitter: URL("https://www.twitter.com"),
            googleplus: URL("https://www.google.com"),
            rss: URL("https://www.rss.com"),
            descriptionLong: "long description",
            descriptionShort: "short description",
            photo: URL("https://example.com/david.png")
        )
    )
}
