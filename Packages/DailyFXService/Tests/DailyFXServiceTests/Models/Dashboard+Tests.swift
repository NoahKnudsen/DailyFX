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
            breakingNews: [.init("breaking")],
            topNews: [.init("top")],
            dailyBriefings: DailyBriefing(
                eu: [.init("eu")],
                asia: [.init("asia")],
                us: [.init("us")]
            ),
            technicalAnalysis: [.init("tech")],
            specialReport: [.init("special")]
        )
    )
}
