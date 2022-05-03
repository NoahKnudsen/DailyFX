//
//  Created by Noah Knudsen on 03/05/2022.
//

public struct Dashboard: Codable, Equatable {
    
    let breakingNews: [NewsStory]
    let topNews: [NewsStory]
    let dailyBriefings: DailyBriefing
    let technicalAnalysis: [NewsStory]
    let specialReport: [NewsStory]
}



public extension Dashboard {
    
    struct DailyBriefing: Codable, Equatable {
        let eu: [NewsStory]
        let asia: [NewsStory]
        let us: [NewsStory]
    }
}
