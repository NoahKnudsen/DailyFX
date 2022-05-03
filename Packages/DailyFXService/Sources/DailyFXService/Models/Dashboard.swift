//
//  Created by Noah Knudsen on 03/05/2022.
//

import Foundational

public struct Dashboard: Codable, Equatable {
    
    public let breakingNews: [NewsStory]
    public let topNews: [NewsStory]
    public let dailyBriefings: DailyBriefing?
    public let technicalAnalysis: [NewsStory]
    public let specialReport: [NewsStory]
}

extension Dashboard {
    
    public init(from decoder: Decoder) throws {
        let o = try decoder.container(keyedBy: CodingKeys.self)
        breakingNews = try o.decodeIfPresent(.breakingNews) ?? []
        topNews = try o.decodeIfPresent(.topNews) ?? []
        dailyBriefings = try o.decodeIfPresent(.dailyBriefings)
        technicalAnalysis = try o.decodeIfPresent(.technicalAnalysis) ?? []
        specialReport = try o.decodeIfPresent(.specialReport) ?? []
    }
}

public extension Dashboard {
    
    struct DailyBriefing: Codable, Equatable {
        public let eu: [NewsStory]
        public let asia: [NewsStory]
        public let us: [NewsStory]
    }
}

extension Dashboard.DailyBriefing {
    
    public init(from decoder: Decoder) throws {
        let o = try decoder.container(keyedBy: CodingKeys.self)
        eu = try o.decodeIfPresent(.eu) ?? []
        asia = try o.decodeIfPresent(.asia) ?? []
        us = try o.decodeIfPresent(.us) ?? []
    }
}
