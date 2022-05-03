import XCTest
@testable import DailyFXService

final class Dashboard_Tests: XCTestCase {
    
    func test_decode() throws {
        
        try Dashboard.testData.testDecode()
    }
    
    func test_codable_identity() throws {
        
        try Dashboard.testData.testCodableIdentity()
    }
}

extension Dashboard {
    
    static let testData = TestDataModel(
        jsonResource: "dashboard.json",
        model: Dashboard(
            breakingNews: [.minimalExample("breaking")],
            topNews: [.minimalExample("top")],
            dailyBriefings: DailyBriefing(
                eu: [.minimalExample("eu")],
                asia: [.minimalExample("asia")],
                us: [.minimalExample("us")]
            ),
            technicalAnalysis: [.minimalExample("tech")],
            specialReport: [.minimalExample("special")]
        )
    )
}
